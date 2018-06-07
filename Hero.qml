import QtQuick 2.0
//import "qrc:/"

Item {
    id: hero
    width: 48
    height: 48

    property vector2d direction: Qt.vector2d(1,0)
    signal exit

    SpriteSequence {
        id: spriteSequence
        width: 48
        height: 48
        interpolate: false

        Sprite {
            name: "right"
            source: "qrc:/img/pacman.png"
            frameCount: 4
            frameDuration: 120
            frameWidth: 48
            frameHeight: 48
            frameX: 0
            frameY: 192
            to: {"right":1}
        }
        Sprite {
            name: "left"
            source: "qrc:/img/pacman.png"
            frameCount: 4
            frameDuration: 120
            frameWidth: 48
            frameHeight: 48
            frameX: 0
            frameY: 96
            to:{"left":1}
        }
        Sprite {
            name: "up"
            source: "qrc:/img/pacman.png"
            frameCount: 4
            frameDuration: 120
            frameWidth: 48
            frameHeight: 48
            frameX: 0
            frameY: 144
            to: {"up":1}
        }
        Sprite {
            name: "down"
            source: "qrc:/img/pacman.png"
            frameCount: 4
            frameDuration: 120
            frameWidth: 48
            frameHeight: 48
            frameX: 0
            frameY: 48
            to: {"down":1}
        }
        Sprite {
            name: "death"
            source: "qrc:/img/pacman.png"
            frameCount: 4
            frameDuration: 120
            frameWidth: 48
            frameHeight: 48
            frameX: 0
            frameY: 0
        }
    }

    Keys.onPressed: {
//        if (event.isAutoRepeat) {
//            return;
//        }

        heroController.handle(hero, event, spriteSequence);

//        switch (event.key) {
//        case Qt.Key_Left:
//        case Qt.Key_A:
//            direction.x = -1
//            direction.y = 0
//            r.jumpTo("left")
//            break;
//        case Qt.Key_Right:
//        case Qt.Key_D:
//            direction.x = 1
//            direction.y = 0
//            r.jumpTo("right")
//            break;
//        case Qt.Key_Up:
//        case Qt.Key_W:
//            direction.x = 0
//            direction.y = -1
//            r.jumpTo("up")
//            break;
//        case Qt.Key_Down:
//        case Qt.Key_S:
//            direction.x = 0
//            direction.y = 1
//            r.jumpTo("down")
//            break;
//        case Qt.Key_Escape:
//            exit()
//        }
    }

    Behavior on x {
        id: behaviorX
        PropertyAnimation{duration: 120}
    }
    Behavior on y {
        id: behaviorY
        PropertyAnimation{duration: 120}
    }

    Timer {
        interval: 120
        triggeredOnStart: true
        running: hero.visible
        repeat: true
        onTriggered: {
            hero.x += direction.x * 12
            hero.y += direction.y * 12
            if(hero.x > 1280)
            {
                behaviorX.enabled = false
                hero.x = -48
                behaviorX.enabled = true
            }
            else if(hero.x < -48)
            {
                behaviorX.enabled = false
                hero.x = 1280
                behaviorX.enabled = true
            }
            if(hero.y > 720)
            {
                behaviorY.enabled = false
                hero.y = -48
                behaviorY.enabled = true
            }
            else if(hero.y < -48)
            {
                behaviorY.enabled = false
                hero.y = 720
                behaviorY.enabled = true
            }
        }
    }

}
