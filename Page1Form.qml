import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Particles 2.0

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent
    }

    Image {
        y:80
        source:"images/background.png"
        anchors.bottom: view.bottom
    }

    Item {
        id: canvasArea
        width: parent.width
        height: parent.height

        Row {
            height: childrenRect.height
            Image {
                id: wave
                y: 30
                source:"images/wave.png"
            }
            Image {
                y: 30
                source:"images/wave.png"
            }
            NumberAnimation on x { from: 0; to: -(wave.width); duration: 16000; loops: Animation.Infinite }
            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation { from: y - 1; to: y + 1; duration: 1600; easing.type: Easing.InOutQuad }
                NumberAnimation { from: y + 1; to: y - 1; duration: 1600; easing.type: Easing.InOutQuad }
            }
        }

        Row {
            opacity: 0.5
            Image {
                id: wave2
                y: 25
                source: "images/wave.png"
            }
            Image {
                y: 25
                source: "images/wave.png"
            }
            NumberAnimation on x { from: -(wave2.width); to: 0; duration: 32000; loops: Animation.Infinite }
            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation { from: y + 1; to: y - 1; duration: 1600; easing.type: Easing.InOutQuad }
                NumberAnimation { from: y - 1; to: y + 1; duration: 1600; easing.type: Easing.InOutQuad }
            }
        }

        Image {
            source: "images/grid.png"
            opacity: 0.5
        }


    }
}
