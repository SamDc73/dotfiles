import QtQuick 2.5
import QtQuick.Controls 2.2 as QtControls
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import QtQuick.Dialogs 1.2



Item {

    id: root
    anchors.fill: parent
    property variant listThemes;
    property string selectTheme: ""
    property int selectIdx: -1
    property var cfg_listThemes: plasmoid.configuration.listThemes
    property var cfg_listWallpaper: plasmoid.configuration.listWallpaper
    property var cfg_listCommand: plasmoid.configuration.listCommand

    ListModel {
        id: myModel
    }

    ListModel {
        id: listOptions
    }

    function updateView(){
        listOptions.clear()
        var t_theme = ""
        var t_wall = ""
        var t_comm = ""
        for (var i = 0; i < cfg_listThemes.length; i++){
            t_theme = cfg_listThemes[i] ? cfg_listThemes[i] : ""
            t_wall =  cfg_listWallpaper[i] ?  cfg_listWallpaper[i] : ""
            t_comm =  cfg_listCommand[i] ?  cfg_listCommand[i] : ""
            listOptions.append({name: t_theme, wallpaper: t_wall, comm: t_comm})
            //listOptions.append({name: cfg_listThemes[i], wallpaper: cfg_listWallpaper[i], comm: cfg_listCommand[i]})
        }
        listAll.currentIndex = -1
        gridOptions.currentIndex = -1
        selectTheme = ""
        selectIdx = -1
    }
    function addItem(){
        cfg_listThemes.push("")
        cfg_listWallpaper.push("")
        cfg_listCommand.push("")
        cfg_listThemes = cfg_listThemes
        cfg_listWallpaper = cfg_listWallpaper
        cfg_listCommand = cfg_listCommand
        updateView()
    }
    function removeItem(v){
        cfg_listThemes.splice(v,1)
        cfg_listThemes = cfg_listThemes
        cfg_listWallpaper.splice(v,1)
        cfg_listWallpaper = cfg_listWallpaper
        cfg_listCommand.splice(v,1)
        cfg_listCommand = cfg_listCommand
        updateView()
    }
    function changeTheme(idx,val){
        cfg_listThemes[idx] = val
        cfg_listThemes = cfg_listThemes
    }
    function changeWallpaper(idx,val){
        cfg_listWallpaper[idx] = val
        cfg_listWallpaper = cfg_listWallpaper
    }
    function changeCommand(idx,val){
        cfg_listCommand[idx] = val
        cfg_listCommand = cfg_listCommand
    }

    ColumnLayout{
        id: mainColumn
        anchors.fill: parent
        RowLayout{
            spacing: units.largeSpacing
            QtControls.Label {  text: listOptions.count + " items" ; anchors.verticalCenter: addButton.verticalCenter}
            PlasmaComponents.Button{
                id: addButton
                text: "Add"
                iconSource: "list-add"
                onClicked: addItem()
            }
            Item{
                Layout.fillWidth: true
            }

        }
        Row{
            width: parent.width
            height: root.height - 60//addButton.height
            spacing: units.largeSpacing
            QtControls.ScrollView {
                
                id: scroll_1
                width: 330
                height: 480
                ListView {
                    id: gridOptions

                    spacing: units.smallSpacing
                    focus: true
                    highlight: Rectangle { color: theme.highlightColor ; radius: 2; opacity: 0.2}
                    highlightMoveDuration: 250
                    highlightMoveVelocity: 1
                    delegate:  Rectangle {
                        id: itemOption
                        width: 310
                        height: 150
                        color: "transparent"
                        property alias text: iTheme.text
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                gridOptions.currentIndex = index
                                root.selectIdx = index
                            }
                        }
                        ColumnLayout{
                            anchors.verticalCenter: parent.verticalCenter;
                            anchors.left: parent.left;
                            anchors.leftMargin: units.smallSpacing
                            spacing: units.smallSpacing  * 0.5

                            Row{
                                QtControls.Label {   width: 100; text: qsTr("Theme"); anchors.verticalCenter: parent.verticalCenter; }
                                QtControls.TextField { id: iTheme ; width: 200; text: name; anchors.verticalCenter: parent.verticalCenter;
                                    onFocusChanged: {if(focus === true) { root.selectIdx = index; gridOptions.currentIndex = index; focus = true;}}
                                    onTextEdited: { changeTheme(index,text)}
                                }
                            }
                            Row{
                                QtControls.Label { width: 100; text: qsTr("Wallpaper");anchors.verticalCenter: parent.verticalCenter; }
                                QtControls.TextField { width: 170; text: wallpaper;anchors.verticalCenter: parent.verticalCenter;
                                    onFocusChanged: {if(focus === true) {root.selectIdx = index; gridOptions.currentIndex = index; focus = true;}}
                                    onTextEdited: { changeWallpaper(index,text)} }
                                PlasmaComponents.Button{
                                    iconSource: "document-open-folder"
                                    onClicked: { root.selectIdx = index; fileDialog.open()}
                                    anchors.verticalCenter: parent.verticalCenter;
                                }
                            }
                            Row{
                                QtControls.Label { width: 100; text: qsTr("Command");anchors.verticalCenter: parent.verticalCenter; }
                                QtControls.TextField { width: 200; text: comm;anchors.verticalCenter: parent.verticalCenter;
                                    onFocusChanged: {if(focus === true) {root.selectIdx = index; gridOptions.currentIndex = index; focus = true;}}
                                    onTextEdited: { changeCommand(index,text)}}
                            }

                            PlasmaComponents.Button{
                                iconSource: "edit-delete"
                                onClicked: removeItem(index);
                                Layout.alignment: Qt.AlignRight
                            }
                        }
                    }
                }

            }

            PlasmaComponents.Button{
                id: buttonIcon
                iconSource: "go-previous"
                anchors.verticalCenter: themesView.verticalCenter
                onClicked: {
                    if(root.selectIdx !== -1 && root.selectTheme !== ""){
                        gridOptions.currentItem.text = root.selectTheme
                        changeTheme(root.selectIdx,root.selectTheme)
                    }
                }
            }

            QtControls.ScrollView {
                id: themesView
                width: 430
                height: Math.ceil(myModel.count * 0.5) * 30 + units.largeSpacing * 2
                
                GridView {
                    id: listAll
                    model: myModel
                    cellWidth: 210
                    cellHeight: 30
                    focus: true
                    delegate:  Item {
                        width: 190
                        height: 30
                        QtControls.Label {
                            id: lb;
                            anchors.verticalCenter: parent.verticalCenter;
                            text: name
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                listAll.currentIndex = index
                                root.selectTheme = name
                            }
                        }
                    }
                    highlight: Rectangle { color: theme.highlightColor ; radius: 2; opacity: 0.5}
                }
            }
        }
        Rectangle{
            height: 1; width: root.width;
            color: theme.textColor
            opacity: 0.4
        }
        Item{
            Layout.fillHeight: true
        }
    }

    FileDialog {
        id: fileDialog
        selectMultiple : false
        title: "Open image"
        nameFilters: [ "Image files (*.jpg *.jpeg *.png *.svg)", "All files (*)" ]
        onAccepted: {
            changeWallpaper(root.selectIdx,fileDialog.fileUrls[0])
            updateView()
        }
    }


    Connections {
        target: executable
        onExited: {
            listThemes = stdout.split('\n')
            for (var i = 0; i < listThemes.length; i++){
                myModel.append({name: listThemes[i]})
            }
            updateView()
            listAll.currentIndex = -1
            gridOptions.model = listOptions
            gridOptions.currentIndex = -1
        }
    }

    PlasmaCore.DataSource {
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(sourceName, exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName)
        }
        function exec(cmd) {
            if (cmd) {
                connectSource(cmd)
            }
        }
        signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
    }
    Component.onCompleted: {
        executable.exec("lookandfeeltool -l")
    }
}
