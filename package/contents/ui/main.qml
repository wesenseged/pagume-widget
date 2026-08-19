/*
SPDX-FileCopyrightText: zayronxio
SPDX-License-Identifier: GPL-3.0-or-later
*/

import QtQuick
import Qt5Compat.GraphicalEffects
import org.kde.plasma.plasmoid
import "js/format.js" as EthCal

PlasmoidItem {
    id: root
    width: 500
    height: 300

    property var weekdays: ({
            Mon: "ሰኞ",
            Tue: "ማክሰኞ",
            Wed: "ረቡዕ",
            Thu: "ሐሙስ",
            Fri: "ዓርብ",
            Sat: "ቅዳሜ",
            Sun: "እሑድ"
        })

    preferredRepresentation: fullRepresentation
    Plasmoid.backgroundHints: "NoBackground"

    FontLoader {
        id: logaFont
        source: "../fonts/Loga-Bold.ttf"
    }

    property string colorDay: Plasmoid.configuration.colordaytext
    property string colorDate: Plasmoid.configuration.colordatetext

    property date today: new Date()
    property var ethToday: EthCal.toEthiopian(today.getFullYear(), today.getMonth() + 1, today.getDate())
    property int currentEthYear: ethToday.year
    property int currentEthDay: ethToday.day
    property int currentEthMonth: ethToday.month
    property string weekdayName: Qt.formatDate(new Date(), "ddd")

    Column {
        width: parent.width
        height: parent.height

        Item {
            id: day
            width: parent.width
            height: parent.height * .7
            Text {
                id: dayText
                width: day.width
                height: day.height
                color: root.colorDay
                text: root.weekdays[root.weekdayName]
                font.family: logaFont.name
                font.pixelSize: parent.height * 0.85
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Item {
            width: parent.width
            height: parent.height * .3
            Rectangle {
                id: backgroundDayAndMonth
                color: root.colorDate
                width: dayAndMonth.implicitWidth * 1.6
                height: dayAndMonth.implicitHeight * 1.5
                radius: height
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: dayAndMonth
                    invert: true
                }
                anchors.right: parent.right
                anchors.rightMargin: (parent.width - width) / 2
                Text {
                    id: dayAndMonth
                    property string date: (root.currentEthMonth >= 1 && root.currentEthMonth <= EthCal.months.length) ? EthCal.months[root.currentEthMonth - 1] : ""

                    width: parent.width
                    height: parent.height

                    text: dayAndMonth.date + "  " + root.currentEthDay + "  " + root.currentEthYear + " ዓ.ም"
                    font.pixelSize: root.height * 0.07
                    font.bold: true
                    visible: false
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }
}
