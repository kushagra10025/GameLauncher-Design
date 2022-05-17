import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 900
    height: 600
    visible: true
    color: "transparent"

    Rectangle {
        id: rectangle
        x: 350
        y: 200
        color: "#7e7e7e"
        radius: 30
        anchors.fill: parent
    }
}
