import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Rectangle {
    id: rectangle
    width: 900
    height: 600
    color: "#561c68"
//    gradient: "NightFade"
    radius: 30
//    border.color: "#ffffff"

    StatusBar{
        id: statusBar
        anchors.topMargin: 35
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
