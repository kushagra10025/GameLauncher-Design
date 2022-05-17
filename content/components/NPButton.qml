import QtQuick 2.15


Rectangle{

    signal clicked();

    id: root
    width: 200
    height: 50
    color: "#7e7e7e"
    radius: 30

    Text{
        text: qsTr("Button")
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 14
        font.family: "Verdana"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MouseArea{
        id:  rootMouseArea
        acceptedButtons: Qt.LeftButton
        anchors.fill: parent
        hoverEnabled: true
//        onClicked: root.clicked();
        onClicked: {
            root.clicked()
        }

        // Hovered Visuals
        onEntered: {
            root.state = "hoveredState"
        }

        onExited: {
            root.state = ""
        }

        // Clicked Visuals
        onPressed: {
            root.state = "clickedState"
        }

        onReleased: {
            root.state = ""
        }
    }

    states: [
        State {
            name: "clickedState"
            PropertyChanges {
                target: root
                color: "#ff0000"
            }
        },
        State {
            name: "hoveredState"
            PropertyChanges {
                target: root
                color: "#00ff00"
            }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "clickedState"
            SequentialAnimation{
                ColorAnimation {
                    duration: 200
                }
            }
        },
        Transition {
            from: "clickedState"
            to: ""
            SequentialAnimation{
                ColorAnimation {
                    duration: 200
                }
            }
        },
        Transition {
            from: ""
            to: "hoveredState"
            SequentialAnimation{
                ColorAnimation {
                    duration: 200
                }
            }
        },
        Transition {
            from: "clickedState"
            to: "hoveredState"
            SequentialAnimation{
                ColorAnimation {
                    duration: 200
                }
            }
        },
        Transition {
            from: "hoveredState"
            to: "clickedState"
            SequentialAnimation{
                ColorAnimation {
                    duration: 200
                }
            }
        }
    ]
}




//Rectangle {
//    id: root

//// public
//    property string text: 'text'

//    signal clicked(); // onClicked: print('onClicked')

//// private
//    width: 500;  height: 100 // default size
//    border.color: text? 'black': 'transparent' // Keyboard
//    border.width: 0.05 * root.height
//    radius:       0.5  * root.height
//    opacity:      enabled  &&  !mouseArea.pressed? 1: 0.3 // disabled/pressed state

//    Text {
//        text: root.text
//        font.pixelSize: 0.5 * root.height
//        anchors.centerIn: parent
//    }

//    MouseArea {
//        id: mouseArea

//        anchors.fill: parent

//        onClicked:  root.clicked() // emit
//    }
//}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}
}
##^##*/
