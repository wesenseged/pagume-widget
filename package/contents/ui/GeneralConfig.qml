/*
SPDX-FileCopyrightText: 2026 Abenezer Wesenseged <wseged@proton.me>
SPDX-License-Identifier: GPL-3.0-or-later
*/

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import org.kde.kirigami as Kirigami

Item {
    id: general

    property alias cfg_colordaytext: dayColorDialog.color
    property alias cfg_colordatetext: colorDialog.color
    property alias cfg_amharicNumber: checkBox.checked
    property alias cfg_font: fontComboBox.currentText

    FontLoader {
        id: logaFont
        source: "../fonts/Loga-Bold.ttf"
    }

    FontLoader {
        id: tayituFont
        source: "../fonts/Tayitu.ttf"
    }

    FontLoader {
        id: balderasuFont
        source: "../fonts/Balderasu-Regular.ttf"
    }

    ColorDialog {
        id: dayColorDialog
    }

    ColorDialog {
        id: colorDialog
    }

    component ColorPicker: RowLayout {
        property alias label: label.text
        property alias color: colorhex.color
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignVCenter

        Label {
            id: label
            Layout.preferredWidth: 100
            topPadding: 6
        }
        Item {
            implicitWidth: 64
            implicitHeight: 18
            Rectangle {
                radius: 4
                width: 64
                height: 18
                border.color: "black"
                opacity: 0.5
                color: "transparent"
                border.width: 2
            }
            Rectangle {
                id: colorhex
                width: 64
                height: 18
                border.color: "#B3FFFFFF"
                border.width: 1
                radius: 4
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        label.text == "Day color:" ? dayColorDialog.open() : colorDialog.open();
                    }
                }
            }
        }
    }

    Kirigami.Heading {
        text: "General"
        topPadding: 10
        leftPadding: 18
        font.pointSize: 14
    }
    ColumnLayout {
        anchors.centerIn: parent
        spacing: Kirigami.Units.largeSpacing
        Layout.fillWidth: true

        ColumnLayout {
            spacing: Kirigami.Units.largeSpacing
            Layout.fillWidth: true

            ColorPicker {
                label: "Day color:"
                color: dayColorDialog.color
            }

            ColorPicker {
                label: "Date color:"
                color: colorDialog.color
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                spacing: Kirigami.Units.smallSpacing
                Label {
                    text: "Font: "
                    Layout.preferredWidth: 100
                    topPadding: 6
                }
                ComboBox {
                    id: fontComboBox
                    Layout.preferredWidth: 100
                    model: [
                        {
                            text: "Loga",
                            font: logaFont.name
                        },
                        {
                            text: "Balderasu",
                            font: balderasuFont.name
                        },
                        {
                            text: "Tayitu",
                            font: tayituFont.name
                        }
                    ]

                    textRole: "text"
                }
            }

            CheckBox {
                id: checkBox
                text: i18nc("@option:check", "Ge'ez Number")
            }
        }
    }
}
