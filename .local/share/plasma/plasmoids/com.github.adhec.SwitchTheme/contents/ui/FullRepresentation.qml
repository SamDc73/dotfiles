/*
    Copyright (C) 2011  Martin Gräßlin <mgraesslin@kde.org>
    Copyright (C) 2012  Gregor Taetzner <gregor@freenet.de>
    Copyright (C) 2012  Marco Martin <mart@kde.org>
    Copyright (C) 2013 2014 David Edmundson <davidedmundson@kde.org>
    Copyright 2014 Sebastian Kügler <sebas@kde.org>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
import QtQuick 2.3
import org.kde.plasma.plasmoid 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kquickcontrolsaddons 2.0
import QtMultimedia 5.8
import QtQuick.Controls 2.0

Item {
    id: fullRoot
    Layout.preferredWidth: units.gridUnit * 14
    Layout.preferredHeight: modelThemes.count * (units.iconSizes.smallMedium + units.smallSpacing * 2) + 64
    Layout.minimumHeight: modelThemes.count * (units.iconSizes.smallMedium + units.smallSpacing * 2) + 64
    height: modelThemes.count * (units.iconSizes.smallMedium + units.smallSpacing * 2) + 64
    ListModel {
        id: modelThemes
    }

    Plasmoid.onExpandedChanged: {
        modelThemes.clear()
        var cfg_listThemes = plasmoid.configuration.listThemes
        for (var i = 0; i < cfg_listThemes.length; i++){
            modelThemes.append({name: cfg_listThemes[i]})
        }
        repeat.model = modelThemes
        fullRoot.height = modelThemes.count * (units.iconSizes.smallMedium + units.smallSpacing * 2) + 64
        repeat.currentIndex = -1
    }

    Column {
        anchors.fill: parent
        spacing: 0

        Rectangle{
            id: headBar
            height: 48
            width: units.gridUnit * 14
            color: "transparent"
            Layout.fillWidth: true

            PlasmaExtras.Heading {
                id: head
                level: 4
                text: i18n("Select theme")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 8
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
                color: theme.textColor
            }
        }

        ListView {
            id: repeat
            width: parent.width;
            height: fullRoot.height - 64
            highlight: PlasmaComponents.Highlight {
                hover: true
            }
            highlightMoveDuration: 250
            highlightMoveVelocity: 1
            delegate: ItemButton{
                //Layout.fillWidth: true
                text: model.name
                iconSource: Qt.resolvedUrl("icons/icon.svg")
                idx: index
                width: units.gridUnit * 14
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: {
                        var str_command = ""
                        var preand = ""
                        if(plasmoid.configuration.listWallpaper[index] !== "" && typeof plasmoid.configuration.listWallpaper[index] !== "undefined"){
                            str_command = str_command + "qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = \"org.kde.image\";d.currentConfigGroup = Array(\"Wallpaper\", \"org.kde.image\", \"General\");d.writeConfig(\"Image\", \""+plasmoid.configuration.listWallpaper[index]+"\")}'; kwriteconfig5 --file ~/.config/kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.image --group General --key Image \""+plasmoid.configuration.listWallpaper[index]+"\""
                            preand = " && "
                        }
                        if(plasmoid.configuration.listCommand[index] !== "" && typeof plasmoid.configuration.listCommand[index] !== "undefined"){
                            str_command = str_command + preand
                            str_command =  str_command + plasmoid.configuration.listCommand[index]
                            preand = " ; "
                        }
                        if(plasmoid.configuration.listThemes[index] !== "" && typeof plasmoid.configuration.listThemes[index] !== "undefined"){
                            str_command = str_command + preand
                            str_command = str_command + "lookandfeeltool --apply " + plasmoid.configuration.listThemes[index]
                        }
                        //console.log(str_command)
                        executable.exec(str_command)
                        plasmoid.expanded = false

                    }

                    onEntered: {
                        repeat.currentIndex = index;
                    }
                }
            }
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
        var cfg_listThemes = plasmoid.configuration.listThemes
        for (var i = 0; i < cfg_listThemes.length; i++){
            modelThemes.append({name: cfg_listThemes[i]})
        }
        repeat.model = modelThemes
    }
}
