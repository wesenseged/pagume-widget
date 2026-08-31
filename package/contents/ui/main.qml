/*
SPDX-FileCopyrightText: 2026 Abenezer Wesenseged <wseged@proton.me>
SPDX-License-Identifier: GPL-3.0-or-later
*/

import QtQuick
import Qt5Compat.GraphicalEffects
import org.kde.plasma.core as PlasmaCore
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

    property var amharicNumbers: ["፩", "፪", "፫", "፬", "፭", "፮", "፯", "፰", "፱", "፲", "፲፩", "፲፪", "፲፫", "፲፬", "፲፭", "፲፮", "፲፯", "፲፰", "፲፱", "፳", "፳፩", "፳፪", "፳፫", "፳፬", "፳፭", "፳፮", "፳፯", "፳፰", "፳፱", "፴"]
    property var amharicYears: ["፳፻፲፰", "፳፻፲፱", "፳፻፳", "፳፻፳፩", "፳፻፳፪", "፳፻፳፫", "፳፻፳፬", "፳፻፳፭", "፳፻፳፮", "፳፻፳፯", "፳፻፳፰", "፳፻፳፱", "፳፻፴"]

    preferredRepresentation: fullRepresentation
    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    property string colorDay: Plasmoid.configuration.colordaytext
    property string colorDate: Plasmoid.configuration.colordatetext
    property string font: Plasmoid.configuration.font
    property bool amharicNumber: Plasmoid.configuration.amharicNumber

    property date today: new Date()
    property var ethToday: EthCal.toEthiopian(today.getFullYear(), today.getMonth() + 1, today.getDate())
    property int currentEthYear: ethToday.year
    property int currentEthDay: ethToday.day
    property int currentEthMonth: ethToday.month
    property string weekdayName: Qt.formatDate(new Date(), "ddd")

    Column {
        width: parent.width
        height: parent.height

        Text {
            id: dayText
            width: parent.width
            height: parent.height * .7
            color: root.colorDay
            text: root.weekdays[root.weekdayName]
            font.family: root.font
            font.pixelSize: parent.height * 0.85
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Item {
            width: parent.width
            height: parent.height * .3
            Rectangle {
                id: backgroundDayAndMonth
                color: root.colorDate
                width: dayAndMonth.implicitWidth * 1.6
                height: dayAndMonth.implicitHeight * 1.5
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
                    text: `${dayAndMonth.date}  ${root.amharicNumber ? root.amharicNumbers[root.currentEthDay - 1] : root.currentEthDay}  ${root.amharicNumber ? root.amharicYears[root.currentEthYear - 2018] : root.currentEthYear} ዓ.ም`
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
