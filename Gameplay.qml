import QtQuick 2.0
import Qt.labs.settings 1.0

Rectangle {
    id: scene

    signal gameStopped

    color: "black"

    property var board: [
        3, 8, 8, 8, 8, 8, 13, 7, 12, 8, 8, 8, 8, 8, 0,
        9, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 9,
        9, 7, 14, 7, 12, 8, 8, 10, 8, 8, 13, 7, 14, 7, 9,
        9, 7, 9, 7, 7, 7, 7, 9, 7, 7, 7, 7, 9, 7, 9,
        9, 7, 2, 13, 7, 14, 7, 15, 7, 14, 7, 12, 1, 7, 9,
        9, 7, 7, 7, 7, 9, 7, 7, 7, 9, 7, 7, 7, 7, 9,
        15, 7, 14, 7, 12, 11, 13, 7, 12, 11, 13, 7, 14, 7, 15,
        7, 7, 9, 7, 7, 7, 7, 7, 7, 7, 7, 7, 9, 7, 7,
        14, 7, 15, 7, 12, 10, 13, 7, 12, 10, 13, 7, 15, 7, 14,
        9, 7, 7, 7, 7, 9, 7, 7, 7, 9, 7, 7, 7, 7, 9,
        9, 7, 3, 13, 7, 15, 7, 14, 7, 15, 7, 12, 0, 7, 9,
        9, 7, 9, 7, 7, 7, 7, 9, 7, 7, 7, 7, 9, 7, 9,
        9, 7, 15, 7, 12, 8, 8, 11, 8, 8, 13, 7, 15, 7, 9,
        9, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 9,
        2, 8, 8, 8, 8, 8, 13, 7, 12, 8, 8, 8, 8, 8, 1,
    ]

    function save(){
        settings.x = hero.x
        settings.y = hero.y
        settings.direction = hero.direction
    }

    function newgame(){
        settings.direction = Qt.vector2d(1,0)
        hero.setCoordinates(0, 7 * 48)
    }

    function drawBoard(){
        // Создаем компонент на основе QML-описания
        var component = Qt.createComponent("Brick.qml")

        // Отдельно генерируем каждый объект
        for (var i = 0; i < board.length; i++) {
            var x = i % 15 * 48
            var y = Math.floor(i / 15) * 48

            // Создаем экземпляр компонента
            var sprite = component.createObject(scene, {"x": x, "y": y, "z": 0, "type": board[i]});
        }
    }

    Hero {
        id: hero
        focus: true
        gameField: board

        onExit: {
            save()
            gameStopped()
        }
    }

    Settings {
        id: settings
        property int x: 0
        property int y: 7*48
        property vector2d direction: Qt.vector2d(1,0)
    }

    Component.onCompleted: {
        drawBoard()
    }

    Component.onDestruction: {
        save()
    }
}
