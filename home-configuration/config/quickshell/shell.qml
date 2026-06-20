import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import "Wallpaper.qml"

import "config.js" as Config

Scope {
    id: root

    NotificationServer {
        id: server
        actionsSupported: true
        bodySupported: true
        imageSupported: true

        onNotification: n => {
            n.tracked = true
            console.log("GOT:", n.summary, "---", n.body)
        }
    }

    PanelWindow {
        anchors { top: true; left: true; right: true }

        implicitHeight: 44
        color: "#000000"

        RowLayout {
            anchors.fill: parent
            spacing: 0

            Rectangle {
                color: "#cba6f7"
                radius: 12

                Layout.leftMargin: 8
                Layout.topMargin: 8
                Layout.bottomMargin: 4

                implicitWidth: 34
                implicitHeight: 32

                Text {
                    anchors.centerIn: parent
                    text: ""
                    color: "#09090F"
                    font.family: "Iosevka Nerd Font"
                    font.pixelSize: 18
                    font.bold: true
                }
            }

            RowLayout {
                Layout.leftMargin: 4
                Layout.topMargin: 8
                Layout.bottomMargin: 4
                spacing: 6

                Repeater {
                    model: 5

                    delegate: Rectangle {
                        radius: 12
                        implicitWidth: 42
                        implicitHeight: 32

                        color: index === 0 ? "#cba6f7" : "#16161a"

                        Text {
                            anchors.centerIn: parent
                            text: index + 1
                            color: index === 0 ? "#09090F" : "#89b4fa"

                            font.family: "Iosevka Nerd Font"
                            font.pixelSize: 14
                            font.bold: true
                        }
                    }
                }
            }

            Rectangle {
                Layout.leftMargin: 8
                Layout.topMargin: 8
                Layout.bottomMargin: 4
                Layout.fillWidth: true

                radius: 12
                color: "#16161a"
                implicitHeight: 32

                Text {
                    anchors.centerIn: parent
                    text: "Desktop"
                    color: "#d3869b"

                    font.family: "Iosevka Nerd Font"
                    font.pixelSize: 14
                    font.bold: true
                }
            }

            Rectangle {
                radius: 12
                color: "#16161a"

                Layout.leftMargin: 8
                Layout.topMargin: 8
                Layout.bottomMargin: 4

                implicitHeight: 32
                implicitWidth: cpuText.implicitWidth + 24

                Text {
                    id: cpuText
                    anchors.centerIn: parent
                    text: "󰍛 CPU"
                    color: "#d3869b"

                    font.family: "Iosevka Nerd Font"
                    font.pixelSize: 14
                    font.bold: true
                }
            }

            Rectangle {
                radius: 12
                color: "#f38ba8"

                Layout.leftMargin: 8
                Layout.rightMargin: 8
                Layout.topMargin: 8
                Layout.bottomMargin: 4

                implicitHeight: 32
                implicitWidth: clockText.implicitWidth + 24

                Text {
                    id: clockText
                    anchors.centerIn: parent
                    text: Qt.formatDateTime(new Date(), "ddd dd MMM hh:mm")
                    color: "#09090F"

                    font.family: "Iosevka Nerd Font"
                    font.pixelSize: 14
                    font.bold: true
                }

                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: clockText.text = Qt.formatDateTime(new Date(), "ddd dd MMM hh:mm")
                }
            }
        }
    }

    PanelWindow {
        anchors { top: true; right: true }
        margins { top: 56; right: 12 }

        implicitWidth: 380
        implicitHeight: Math.max(1, column.implicitHeight)
        color: "transparent"
        exclusionMode: ExclusionMode.Ignore

        ColumnLayout {
            id: column
            width: parent.width
            spacing: 10

            Repeater {
                model: server.trackedNotifications

                delegate: Rectangle {
                    id: card
                    required property var modelData

                    Timer {
                        running: card.modelData.urgency !== NotificationUrgency.Critical
                        interval: Config.notifications.timeout
                        repeat: false
                        onTriggered: card.modelData.dismiss()
                    }

                    Layout.fillWidth: true
                    implicitHeight: layout.implicitHeight + 20

                    radius: 8
                    color: Config.colors.bg

                    border.width: 2
                    border.color: modelData.urgency === NotificationUrgency.Critical
                        ? Config.colors.red
                        : Config.colors.purple

                    RowLayout {
                        id: layout
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Image {
                            Layout.preferredWidth: 36
                            Layout.preferredHeight: 36
                            Layout.alignment: Qt.AlignTop
                            fillMode: Image.PreserveAspectFit
                            visible: source.toString() !== ""
                            source: card.modelData.image || card.modelData.appIcon || ""
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            Text {
                                Layout.fillWidth: true
                                text: card.modelData.summary
                                color: Config.colors.cyan

                                font.family: Config.bar.fontFamily
                                font.pixelSize: Config.bar.fontSize
                                font.bold: true

                                elide: Text.ElideRight
                            }

                            Text {
                                Layout.fillWidth: true
                                visible: text !== ""
                                text: card.modelData.body

                                color: Config.colors.fg

                                font.family: Config.bar.fontFamily
                                font.pixelSize: Config.bar.fontSize - 1

                                wrapMode: Text.WordWrap
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: card.modelData.dismiss()
                    }
                }
            }
        }
    }
}
