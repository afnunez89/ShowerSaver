import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    width: 383
    height: 680
    visible: true
    title: qsTr("ShowerSaver app")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page_Timer {
        }

        Page_Log {
        }

        Page_Settings {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Timer")
            background: Rectangle {
                anchors.fill: parent
                color: "steelblue"
            }
        }
        TabButton {
            text: qsTr("Logs")
            background: Rectangle {
                      anchors.fill: parent
                      color: "steelblue"
                  }
        }
        TabButton {
            text: qsTr("Settings")
            background: Rectangle {
                anchors.fill: parent
                color: "steelblue"
            }
        }
    }
}
