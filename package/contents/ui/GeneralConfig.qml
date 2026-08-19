import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import org.kde.kirigami as Kirigami

Item {
    id: configRoot

    signal configurationChanged

    property alias cfg_colordaytext: dayColorDialog.color
    property alias cfg_colordatetext: colorDialog.color

    ColorDialog {
        id: dayColorDialog
    }
    ColorDialog {
        id: colorDialog
    }
    ColumnLayout {
        spacing: Kirigami.Units.largeSpacing
        Layout.fillWidth: true

        Kirigami.Heading {
            text: "General"
            font.pointSize: 18
        }

        GridLayout {
            columns: 2
            Label {
                text: "Color day text:"
                Layout.minimumWidth: configRoot.width / 2
                horizontalAlignment: Label.AlignRight
            }
            Item {
                width: 64
                height: 24
                Rectangle {
                    width: 64
                    radius: 4
                    height: 24
                    border.color: "black"
                    opacity: 0.5
                    color: "transparent"
                    border.width: 2
                }
                Rectangle {
                    id: colorhex
                    color: dayColorDialog.color
                    border.color: "#B3FFFFFF"
                    border.width: 1
                    width: 64
                    radius: 4
                    height: 24
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            dayColorDialog.open();
                        }
                    }
                }
            }
            Label {}
            Label {}
            Label {
                text: "Color date text"
                Layout.minimumWidth: configRoot.width / 2
                horizontalAlignment: Label.AlignRight
            }
            Item {
                width: 64
                height: 24
                Rectangle {
                    width: 64
                    radius: 4
                    height: 24
                    border.color: "black"
                    opacity: 0.5
                    color: "transparent"
                    border.width: 2
                }
                Rectangle {
                    color: colorDialog.color
                    border.color: "#B3FFFFFF"
                    border.width: 1
                    width: 64
                    radius: 4
                    height: 24
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            colorDialog.open();
                        }
                    }
                }
            }
        }
    }
}
