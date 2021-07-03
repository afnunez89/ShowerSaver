import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Particles 2.0

Page {
    id: page
    width: 240
    height: 480

    property int wave_y: height
    property int timerElapsed: 0

    header: Label {
        color: "#ffffff"
        text: qsTr("ShowerSaver")
        font.pixelSize: Qt.application.font.pixelSize * 2
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        padding: 10
        background: Rectangle {
            anchors.fill: parent
            color: "steelblue"
        }
    }

    PropertyAnimation {
        running: timerShower.running
        target: page
        properties: "wave_y"
        from: parent.height - wave.height
        to:200
        duration: (timerSet.value*60000)
        onStopped: wave_y = parent.height - wave.height
    }

    Rectangle {
        id: background
        width: parent.width
        height: parent.height - y
        gradient: Gradient {
            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 0.5; color: "whitesmoke" }
            GradientStop { position: 1.0; color: "steelblue" }
        }
    }

    SpinBox {
        id: timerSet
        x: 201
        y: 75
        width: 199
        height: 71
        anchors.horizontalCenterOffset: 0
        value: 5
        editable: true
        to: 30
        from: 1
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
        font.pointSize: 25
        onValueChanged:
        {
            timerShower.stop()
            timerElapsed = 0
        }
    }

    Timer{
        id: timerShower
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            timerElapsed++
            if(timerElapsed > (timerSet.value*60)){
                timerShower.stop()
                timerElapsed = 0
            }
        }
    }

    Rectangle {
        id: water
        color: "darkblue"
        visible: timerShower.running
        y: wave_y + wave.height - 10
        width: parent.width
        height: parent.height - wave_y
    }

    Button {
        id: startStop
        x: 275
        width: 110
        height: 50
        text: timerShower.running ? "STOP" : "RUN"
        anchors.top: timerSet.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            if (timerShower.running){
                timerElapsed = 0
                timerShower.stop()
            } else {
                timerElapsed = 0
                timerShower.start()
            }
        }
    }

    Item {
        id: canvasArea
        width: parent.width
        height: parent.height
        visible: timerShower.running

        Row {
            height: childrenRect.height
            Image {
                id: wave
                y: wave_y
                source:"images/wave.png"
            }
            Image {
                y: wave_y
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
                y: wave_y
                source: "images/wave.png"
            }
            Image {
                y: wave_y
                source: "images/wave.png"
            }
            NumberAnimation on x { from: -(wave2.width); to: 0; duration: 32000; loops: Animation.Infinite }
            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation { from: y + 1; to: y - 1; duration: 1600; easing.type: Easing.InOutQuad }
                NumberAnimation { from: y - 1; to: y + 1; duration: 1600; easing.type: Easing.InOutQuad }
            }
        }

    }
}
