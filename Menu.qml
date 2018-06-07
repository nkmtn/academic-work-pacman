import QtQuick 2.0
import QtQuick.Layouts 1.0
//import "qrc:/"

Rectangle {
    id: menu

    signal gameStarted
    signal gameContinued

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 5
        Button {
            text: "Новая игра"
            onClicked:{
                menu.gameStarted()
            }
        }
        Button {
            text: "Продолжить"
            onClicked: menu.gameContinued()
        }
        Button {
            text: "Выход"
            onClicked: {
                Qt.quit()
            }
        }

        }
    }

