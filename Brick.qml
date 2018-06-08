import QtQuick 2.0

Item {
    width: 48
    height: 48
    property int type: 7

    Image {
        anchors.fill: parent
        source: "img/" + type + ".png"
    }
}
