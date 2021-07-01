import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("ShowerSaver")
        font.pixelSize: Qt.application.font.pixelSize * 2
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        padding: 10
    }

    Label {
        text: qsTr("This page is for the settings.")
        anchors.centerIn: parent
    }
}
