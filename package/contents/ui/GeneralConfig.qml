import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.kirigami as Kirigami

Item {
    id: general

    signal configurationChanged

    property alias cfg_colordaytext: dayColorDialog.color
    property alias cfg_colordatetext: colorDialog.color
    property bool cfg_amharic_number: true

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

        Label {
            id: label
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

    ColumnLayout {
        spacing: Kirigami.Units.largeSpacing
        Layout.fillWidth: true

        Kirigami.Heading {
            text: "General"
            topPadding: 10
            leftPadding: 18
            font.pointSize: 14
        }

        ColumnLayout {
            spacing: Kirigami.Units.largeSpacing
            Layout.fillWidth: true

            ColorPicker {
                label: "Day color:"
                color: dayColorDialog.color
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 40
            }

            ColorPicker {
                label: "Date color:"
                color: colorDialog.color
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 40
            }

            PlasmaComponents3.CheckBox {
                text: i18n("Ge'ez Number")
                checked: false
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 40
            }
        }
    }
}
