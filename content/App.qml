/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Studio Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.15
import QtQuick.Window 2.15
import "components"
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Window {
    id: mainWindow
    width: 900
    height: 600

    minimumHeight: mainWindow.height
    minimumWidth: mainWindow.width
    maximumHeight: mainWindow.height
    maximumWidth: mainWindow.width

    visible: true
    title: "Game Launcher Design"
    color: "transparent"

    Rectangle{
        id: bgRectangle
        width: 50
        height: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        gradient: "PremiumDark"
        radius: 30

        LoadingSpriteComponent{
            id: loadingSpriteComponent
            width: 256
            height: 256
            anchors.verticalCenter: parent.verticalCenter
            playing: false
            opacity: 0
            frameDuration: 56
            interpolate: false
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Image{
            id: logoImage
            width: 128
            height: 128
            opacity: 0
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Image.AlignHCenter
            verticalAlignment: Image.AlignVCenter
            source: "../resources/placeholder_logo.png"
            fillMode: Image.Stretch
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text{
            id: loadingText
            width: parent
            color: "#ffffff"
            opacity: 0
            text: "Loading ..."
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: loadingSpriteComponent.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: -30

            font.family: "Verdana"
        }

        Text{
            id: welcomeText
            anchors.fill : parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#ffffff"
            opacity: 0
            text: "Welcome !!!"
            font.family: "Verdana"
            font.pointSize: 32
        }

        states: [
            State {
                name: "splashScreenSize"
                PropertyChanges {
                    target: bgRectangle
                    width: 300
                    height: 400
                }
                PropertyChanges { target: loadingSpriteComponent; opacity: 1 }
                PropertyChanges { target: loadingText; opacity: 1 }
                PropertyChanges { target: logoImage; opacity: 1 }
            },
            State {
                name: "launcherScreenSize"
                PropertyChanges {
                    target: bgRectangle
                    width: mainWindow.width
                    height: mainWindow.height
                }
                PropertyChanges { target: loadingSpriteComponent; opacity: 0 }
                PropertyChanges { target: loadingText; opacity: 0 }
                PropertyChanges { target: logoImage; opacity: 0 }
                PropertyChanges { target: welcomeText; opacity: 1 }
            }
        ]

        transitions: [
            Transition {
                from: ""
                to: "splashScreenSize"
                SequentialAnimation{
                    NumberAnimation{
                        property: "width"
                        easing.bezierCurve: [0.77,0,0.175,1,1,1]
                        duration: 300
                    }
                    NumberAnimation{
                        property: "height"
                        easing.bezierCurve: [0.77,0,0.175,1,1,1]
                        duration: 300
                    }
//                    PauseAnimation {
//                        duration: 100
//                    }
                    ParallelAnimation{
                        PropertyAction{
                            target: loadingSpriteComponent
                            property: "playing"
                            value: true
                        }
                        PropertyAnimation{
                            targets: [loadingSpriteComponent, loadingText, logoImage]
                            property: "opacity"
                            easing.bezierCurve: [0.445,0.05,0.55,0.95,1,1]
                            duration: 300
                        }
                    }
                }
            },
            Transition {
                from: "splashScreenSize"
                to: "launcherScreenSize"
                SequentialAnimation{
                    PropertyAnimation{
                        targets: [loadingSpriteComponent, loadingText, logoImage]
                        property: "opacity"
                        easing.bezierCurve: [0.445,0.05,0.55,0.95,1,1]
                        duration: 300
                    }
                    NumberAnimation{
                        property: "width"
                        easing.bezierCurve: [0.77,0,0.175,1,1,1]
                        duration: 300
                    }
                    ParallelAnimation{
                        PropertyAnimation{
                            target: welcomeText
                            property: "opacity"
                            easing.bezierCurve: [0.445,0.05,0.55,0.95,1,1]
                            duration: 300
                        }
                        NumberAnimation{
                            property: "height"
                            easing.bezierCurve: [0.77,0,0.175,1,1,1]
                            duration: 300
                        }
                    }
                    PauseAnimation {
                        duration: 1300
                    }
                    PropertyAnimation {
                        target: welcomeText;
                        property: "opacity"
                        to: 0
                        duration: 300
                    }
                }
            },
            Transition {
                from: "launcherScreenSize"
                to: ""
                SequentialAnimation{
                    NumberAnimation{
                        property: "width"
                        easing.bezierCurve: [0.77,0,0.175,1,1,1]
                        duration: 300
                    }
                    NumberAnimation{
                        property: "height"
                        easing.bezierCurve: [0.77,0,0.175,1,1,1]
                        duration: 300
                    }
                }
            }
        ]
    }

    StatusBar{
        id: statusBar
        anchors.topMargin: 35
        z: 100
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(bgRectangle.state === "") bgRectangle.state = "splashScreenSize"
            else if(bgRectangle.state === "splashScreenSize") bgRectangle.state = "launcherScreenSize"
            else bgRectangle.state = ""
        }
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:16;height:400;width:300}
}
##^##*/
