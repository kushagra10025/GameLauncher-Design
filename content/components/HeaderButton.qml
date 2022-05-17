import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: 200
    height: 50
    color: root.bgcolor

    // Custom Properties
    // Signals
    signal clicked();
    // General
    property color bgcolor: "transparent"
    // Text Properties
    property string buttonText: "Button"
    property int fontSize: 13
    property string fontFamily: "Verdana"
    property real fontLetterSpacing: 1.0
    property int fontMarginAdjustment: 10
    property color fontColor: root.fontColorDefault
    property color fontColorDefault: "#c8c9cc"
    property color fontColorHover: "#edeef2"
    property color fontColorActive: "#fbfcff"
    // Line Properties
    property int lineWidth: 80
    property int lineWidthDefault: root.lineWidth
    property int lineWidthHover: 50
    property int lineWidthActive: 20
    property int lineHeight: 5
    property color lineColor: "#7E7E7E"
    property int lineRadius: 3

    // NOTE
    // TODO lineWidth, lineWidthHover, lineWidthDefault, lineWidthActive
    // all the above depend on width of the widget
    // create a mathematical formula for correlation between them to prevent manual adjustment
    // i.e, automatic change of lineWidth(s) along with change in width of the HeaderButton

    Text{
        id: btnText
        text: root.buttonText
        color: root.fontColor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: rectUnderline.top
        font.letterSpacing: root.fontLetterSpacing
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.capitalization: Font.AllUppercase
        font.pointSize: root.fontSize
        font.family: root.fontFamily
        anchors.rightMargin: (root.width/2)
        anchors.leftMargin: (root.width/2)
        anchors.bottomMargin: (root.height/2)-(rectUnderline.height+root.fontMarginAdjustment)
    }

    Rectangle{
        id: rectUnderline
        anchors.left: root.left
        anchors.right: root.right
        anchors.bottom: root.bottom
        height: root.lineHeight
        color: root.lineColor
        radius: root.lineRadius
        anchors.leftMargin: root.lineWidth
        anchors.rightMargin: root.lineWidth
    }

    MouseArea{
        id: btnMouseArea
        anchors.fill: root
        acceptedButtons: Qt.LeftButton
        hoverEnabled: true
        // Clicked
        onClicked: {
            root.clicked();
        }

        // Pressed and Release
        onPressed: {
            root.state = "activeState";
        }
        onReleased: {
            root.state = "hoveredState";
        }

        // Enter and Exit
        onEntered: {
            root.state = "hoveredState";
        }
        onExited: {
            root.state = "";
        }
    }

    states: [
        State {
            name: "hoveredState"
            PropertyChanges {
                target: root
                lineWidth: lineWidthHover
                fontColor: fontColorHover
            }
        },
        State {
            name: "activeState"
            PropertyChanges {
                target: root
                lineWidth: lineWidthActive
                fontColor: fontColorActive
            }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "hoveredState"
            SequentialAnimation{
                PropertyAnimation{
                    property: "lineWidth"
                    easing.bezierCurve: [0.77,0,0.175,1,1,1]
                    duration: 50
                }
            }
        },
        Transition {
            from: "hoveredState"
            to: ""
            SequentialAnimation{
                PropertyAnimation{
                    property: "lineWidth"
                    easing.bezierCurve: [0.77,0,0.175,1,1,1]
                    duration: 50
                }
            }
        },
        Transition {
            from: "hoveredState"
            to: "activeState"
            SequentialAnimation{
                PropertyAnimation{
                    property: "lineWidth"
                    easing.bezierCurve: [0.77,0,0.175,1,1,1]
                    duration: 50
                }
            }
        },
        Transition {
            from: "activeState"
            to: "hoveredState"
            SequentialAnimation{
                PropertyAnimation{
                    property: "lineWidth"
                    easing.bezierCurve: [0.77,0,0.175,1,1,1]
                    duration: 50
                }
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}
}
##^##*/
