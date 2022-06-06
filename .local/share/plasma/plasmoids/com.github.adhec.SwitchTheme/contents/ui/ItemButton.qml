/*
    Copyright (C) 2011  Martin Gräßlin <mgraesslin@kde.org>

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
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.kquickcontrolsaddons 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: button
    property string iconSource
    property alias text: labelElement.text
    property int idx
    height: units.iconSizes.smallMedium + units.smallSpacing * 2
    color: "transparent"
    PlasmaCore.IconItem {
        id: iconElement
        width: units.iconSizes.smallMedium
        height: width
        source: iconSource
        anchors{
            left: parent.left
            leftMargin: units.smallSpacing
            verticalCenter: parent.verticalCenter
        }
    }

    ColorOverlay {
        anchors.fill: iconElement
        source:       iconElement
        color:       theme.textColor
    }

    PlasmaComponents.Label {
        id: labelElement

        anchors {
            left: iconElement.right            
            right: parent.right
            rightMargin: units.largeSpacing
            verticalCenter: iconElement.verticalCenter
        }
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
        wrapMode: Text.WordWrap
    }
} // button
