import QtQuick 2.15

Item {

    property string spriteSheet: "../../resources/loader_ss5.png"
    property int frameCount: 64
    property int frameDuration: 42
    property int frameHeight: 256
    property int frameWidth: 256
    property bool interpolate: false
    property int animLoop: AnimatedSprite.Infinite
    property bool playing: true

    id: loadingSprite
    width: 256
    height: 256

    AnimatedSprite{
        width: loadingSprite.width
        height: loadingSprite.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        frameCount : loadingSprite.frameCount
        frameDuration : loadingSprite.frameDuration
        frameHeight : loadingSprite.frameHeight
        frameWidth : loadingSprite.frameWidth
        frameX : 0
        frameY : 0
        interpolate : loadingSprite.interpolate
        loops: loadingSprite.animLoop
        source : loadingSprite.spriteSheet
        running : loadingSprite.playing
    }
}
