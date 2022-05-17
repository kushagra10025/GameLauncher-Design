import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "components"

Rectangle {
    id: statusBar
    height: dropdownActionButton.height
    anchors{
        left: parent.left
        top: parent.top
        right: parent.right
    }

//    color: "#00734f"
    color: "transparent"

    HeaderButton{
        id: playBtn
//        bgcolor: "#7e7e7e"
        width: 100
        lineHeight: 5
        fontMarginAdjustment: 10
        lineWidthHover: 35
        lineWidthDefault: 45
        lineWidthActive: 25
        lineWidth: 45
        lineColor: "#2aafd3"
        buttonText: "Play"
        anchors{
            left: parent.left
            leftMargin: 10
        }
    }

    HeaderButton{
        id: newsBtn
//        bgcolor: "#4e4e4e"
        width: 100
        lineHeight: 5
        fontMarginAdjustment: 10
        lineWidthHover: 35
        lineWidthDefault: 45
        lineWidthActive: 20
        lineWidth: 45
        lineColor: "#2aafd3"
        buttonText: "News"
        anchors{
            left: playBtn.right
            leftMargin: 10
        }
    }

    HeaderButton{
        id: communityBtn
//        bgcolor: "#4e7e4e"
        width: 150
        lineHeight: 5
        fontMarginAdjustment: 10
        lineWidthHover: 49
        lineWidthDefault: 69
        lineWidthActive: 20
        lineWidth: 69
        lineColor: "#2aafd3"
        buttonText: "Community"
        anchors{
            left: newsBtn.right
            leftMargin: 10
        }
    }

    DropdownButton{
        id: dropdownActionButton
        anchors{
            top: parent.top
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: 30
        }
    }

//    Button{
//        id: settingsButton
//        width: 70
//        anchors{
//            top: parent.top
//            right: parent.right
//            verticalCenter: parent.verticalCenter
//        }

////        background: Rectangle{
////            color: "transparent"
////        }

//        Image{
//            anchors.fill: parent
//            horizontalAlignment: Image.AlignHCenter
//            verticalAlignment: Image.AlignVCenter
//            source:"Settings.svg"
//            anchors.rightMargin: 10
//            anchors.leftMargin: 10
//            anchors.bottomMargin: 10
//            anchors.topMargin: 10
//            fillMode: Image.PreserveAspectFit
//        }

////        onClicked: {
////            console.log("Hello World!");
////        }

//    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
