import QtQuick 2.10
import QtQuick.Window 2.10
//import "qrc:/"

Window {
    visible: true
    width: 1280
    height: 720
    maximumHeight: 720
    maximumWidth: 1280
    minimumHeight: 720
    minimumWidth: 1280
    title: qsTr("Pacman!!!")


    Rectangle {
        anchors.fill: parent

        Menu {
            id: menu
            color: "black"
            anchors.fill: parent
            onGameStarted: {
                gameplay.newgame()
                parent.state = "gameplay"
            }
            onGameContinued: {
                parent.state = "gameplay"
            }
        }

        Gameplay {
            id: gameplay
            color: "black"
            anchors.fill: parent
            onGameStopped: parent.state = "menu"
        }

        states: [
            State {
                name: "menu"
                PropertyChanges {
                    target: menu
                    visible: true
                }
                PropertyChanges {
                    target: gameplay
                    visible: false
                }
            },
            State {
                name: "gameplay"
                PropertyChanges {
                    target: menu
                    visible: false
                }
                PropertyChanges {
                    target: gameplay
                    visible: true
                }
            }
        ]

        state: "menu"
    }
}
