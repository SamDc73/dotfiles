/*
    Copyright (C) 2011  Martin Gräßlin <mgraesslin@kde.org>
    Copyright (C) 2012  Gregor Taetzner <gregor@freenet.de>
    Copyright (C) 2012  Marco Martin <mart@kde.org>
    Copyright (C) 2013  David Edmundson <davidedmundson@kde.org>
    Copyright (C) 2015  Eike Hein <hein@kde.org>

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
import QtQuick 2.0
import QtQuick.Layouts 1.1

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kquickcontrolsaddons 2.0

import QtGraphicalEffects 1.0

Item {
    id: base
    readonly property bool inPanel: (plasmoid.location === PlasmaCore.Types.TopEdge
                                     || plasmoid.location === PlasmaCore.Types.RightEdge
                                     || plasmoid.location === PlasmaCore.Types.BottomEdge
                                     || plasmoid.location === PlasmaCore.Types.LeftEdge)
    readonly property bool vertical: (plasmoid.formFactor === PlasmaCore.Types.Vertical)

    Plasmoid.switchWidth:  units.gridUnit * 15
    Plasmoid.switchHeight: units.gridUnit * 30

    Plasmoid.fullRepresentation: FullRepresentation { }
    Plasmoid.compactRepresentation: Rectangle{
        Layout.preferredHeight: 24
        Layout.preferredWidth: 24
        anchors.margins: 0
        Layout.maximumWidth: {
            if (vertical) {
                return 24//units.iconSizeHints.panel;
            } else {
                return 24// TODO: fix from settings
            }
        }

        Layout.maximumHeight: {
            if (vertical) {
                return 24//Math.min(units.iconSizeHints.panel, parent.width) * 1//buttonIcon.aspectRatio;
            } else {
                return 24//units.iconSizeHints.panel;
            }
        }
        color: "transparent"
        Image{
            id: buttonIcon
            x: Math.round(parent.width/2) - 12
            y: Math.round(parent.height/2) - 12
            height: 22
            width:  22
            fillMode: Image.PreserveAspectFit
            source: Qt.resolvedUrl("icons/logo.svg")
            smooth: true
            visible: false
        }

        ColorOverlay {
            anchors.fill: buttonIcon
            source:       buttonIcon
            color:        theme.textColor
        }

        MouseArea {
            id: playArea
            anchors.fill: parent
            onClicked: plasmoid.expanded = !plasmoid.expanded
        }
    }

    Component.onCompleted: {
        if (plasmoid.hasOwnProperty("activationTogglesExpanded")) {
            plasmoid.activationTogglesExpanded = true
        }
    }
} // root
