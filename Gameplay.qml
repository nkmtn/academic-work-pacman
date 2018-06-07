import QtQuick 2.0
import Qt.labs.settings 1.0
//import "qrc:/"

Rectangle {

    signal gameStopped

    color: "black"

    function start(){
        hero.x = 0
        hero.y = 0
        hero.direction = Qt.vector2d(1,0)
    }

    function save(){
        settings.x = hero.x
        settings.y = hero.y
        settings.direction = hero.direction
    }

    Hero {
        id: hero
        focus: true
        x: settings.x
        y: settings.y
        direction: settings.direction

        onExit: {
            save()
            gameStopped()
        }
    }

    Settings {
        id: settings
        property int x: 0
        property int y: 0
        property vector2d direction: Qt.vector2d(1,0)
    }

    Component.onDestruction: {
        save()
    }
}
