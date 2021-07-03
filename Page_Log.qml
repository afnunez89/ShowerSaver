import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 240
    height: 480

    header: Label {
        text: qsTr("ShowerSaver")
        font.pixelSize: Qt.application.font.pixelSize * 2
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        padding: 10
    }

    Label {
        text: qsTr("This page is for the logs.")
        anchors.centerIn: parent
    }
}
