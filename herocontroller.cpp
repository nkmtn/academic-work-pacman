#include "herocontroller.h"
#include <Qt>
#include<QDebug>

HeroController::HeroController(QObject *parent) : QObject(parent)
{

}


void HeroController::handle(QObject *hero, QObject *event, QObject *spriteSequence)
{
    if (event->property("isAutoRepeat").toBool()) {
        return;
    }

    int key = event->property("key").toInt();

    switch (key) {
    case Qt::Key_Left:
    case Qt::Key_A:
        hero->setProperty("direction", QVector2D(-1, 0));
        QMetaObject::invokeMethod(spriteSequence, "jumpTo", Q_ARG(QString, "left"));
        break;
    case Qt::Key_Right:
    case Qt::Key_D:
        hero->setProperty("direction", QVector2D(1, 0));
        QMetaObject::invokeMethod(spriteSequence, "jumpTo", Q_ARG(QString, "right"));
        break;
    case Qt::Key_Up:
    case Qt::Key_W:
        hero->setProperty("direction", QVector2D(0, -1));
        QMetaObject::invokeMethod(spriteSequence, "jumpTo", Q_ARG(QString, "up"));
        break;
    case Qt::Key_Down:
    case Qt::Key_S:
        hero->setProperty("direction", QVector2D(0, 1));
        QMetaObject::invokeMethod(spriteSequence, "jumpTo", Q_ARG(QString, "down"));
        break;
    case Qt::Key_Escape:
        QMetaObject::invokeMethod(hero, "exit");
    }
}
