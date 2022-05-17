import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    id: dropdownRectangleBG
    width: 200
    height: 175
//    color: "#7e7e7e"
    color: "transparent"

    property int dropdownMenuHeight : 125

    Rectangle{
        id: dropdownRectangle
        width: 50
        height: 50
        color: "#00ffffff"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        ColorImage{
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            source:"../Settings.svg"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        z: 100
    }

    Rectangle{
        id: listHolder
        width: dropdownRectangleBG.width - dropdownRectangle.width
//        height: dropdownRectangleBG.height
        height: 0
        color: "#6e6e6e"
        radius: 10
        anchors.right: parent.right
        anchors.top: dropdownRectangle.bottom
        anchors.rightMargin: 0
        anchors.topMargin: 0

        Rectangle{
            anchors.fill: listHolder
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            anchors.topMargin: 5
            color: "#4e4e4e"
            radius: 10
            ListModel {
                id: fruitModel
                property string language: "en"
                ListElement {
                    name: "Settings"
//                    name: "Apple"
//                    cost: 2.45
                }
                ListElement {
                    name: "Exit"
//                    name: "Apple"
//                    cost: 2.45
                }
            }

            Component {
                id: fruitDelegate
                Column {
                    id: column
                    width: parent.width
                    height: 50
                    HeaderButton{
//                        text: name + " $" +cost
                        buttonText: name
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 100
                        lineHeight: 5
                        fontSize: 12
                        fontMarginAdjustment: 10
                        lineWidthHover: 35
                        lineWidthDefault: 45
                        lineWidthActive: 20
                        lineWidth: 45
                        lineColor: "#2aafd3"
                    }
                }
            }

            ListView {
                property color fruit_color: "green"
                model: fruitModel
                delegate: fruitDelegate
                anchors.fill: parent
//                clip: true
            }
        }

        states: [
            State {
                name: "expandedState"
                PropertyChanges {
                    target: listHolder
                    height: dropdownMenuHeight
                }
            }
        ]

        transitions:[
            Transition {
                from: ""
                to: "expandedState"
                PropertyAnimation{
                    property: "height"
                    easing.bezierCurve: [0.23,1,0.32,1,1,1]
                    duration: 150
                }
            },
            Transition {
                from: "expandedState"
                to: ""
                PropertyAnimation{
                    property: "height"
                    easing.bezierCurve: [0.23,1,0.32,1,1,1]
                    duration: 150

                }
            }
        ]
    }

    MouseArea{
        id: mouseArea
        anchors.fill: dropdownRectangle
        hoverEnabled: true
        onClicked: {
            listHolder.state = listHolder.state === "expandedState" ? "" : "expandedState"
        }
//        onEntered:{
//            listHolder.state = "expandedState"
//        }

//        onExited: {
//            listHolder.state = ""
//        }
    }
}
