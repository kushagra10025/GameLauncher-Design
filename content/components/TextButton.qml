import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle1
    width: 200
    height: 50
    color: "transparent"
    opacity: 0.5


    property string btnText: "Button"
//    color: "#7e7e7e"


    Rectangle {
        id: rectangle
        height: 5
        color: "#2e2e2e"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
    }


    Text{
        id: buttonText
        color: "#ffffff"
        text: rectangle1.btnText
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: rectangle.top
        font.letterSpacing: 1

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.rightMargin: 80
        anchors.leftMargin: 80
        anchors.topMargin: 10
        anchors.bottomMargin: 10

        font.family: "Verdana"
        font.pointSize: 15
    }

    MouseArea{
        id:  rootMouseArea
        acceptedButtons: Qt.LeftButton
        anchors.fill: parent
        hoverEnabled: true
//        onClicked: root.clicked();
        onClicked: {
            rectangle1.clicked()
        }

        // Hovered Visuals
        onEntered: {
            rectangle1.state = "hoverState"
        }

        onExited: {
            rectangle1.state = ""
        }

        // Clicked Visuals
        onPressed: {
            rectangle1.state = "activeState"
        }

//        onReleased: {
//            root.state = ""
//        }
    }

    states: [
        State {
            name: "activeState"
            PropertyChanges {
                target: rectangle1
                opacity: 1
            }
        },
        State {
            name: "hoverState"
            PropertyChanges {
                target: rectangle1
                opacity: 0.75
            }
        }

    ]
}
