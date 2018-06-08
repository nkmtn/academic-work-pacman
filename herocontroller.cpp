#include "herocontroller.h"
#include <Qt>
#include<QDebug>

HeroController::HeroController(QObject *parent) : QObject(parent)
{

}


QVector2D HeroController::handle(QObject *hero, QObject *event, QObject *spriteSequence)
{
    if (event->property("isAutoRepeat").toBool()) {
        QVariant variant = hero->property("direction");
        return qvariant_cast<QVector2D>(variant);
    }

    int key = event->property("key").toInt();

    switch (key) {
    case Qt::Key_Left:
    case Qt::Key_A:
//        hero->setProperty("newDirection", QVector2D(-1, 0));
        return QVector2D(-1, 0);
//        QMetaObject::invokeMethod(spriteSequence, "jumpTo", Q_ARG(QString, "left"));
        break;
    case Qt::Key_Right:
    case Qt::Key_D:
//        hero->setProperty("newDirection", QVector2D(1, 0));
//        QMetaObject::invokeMethod(spriteSequence, "jumpTo", Q_ARG(QString, "right"));
        return QVector2D(1, 0);
        break;
    case Qt::Key_Up:
    case Qt::Key_W:
//        hero->setProperty("newDirection", QVector2D(0, -1));
//        QMetaObject::invokeMethod(spriteSequence, "jumpTo", Q_ARG(QString, "up"));
        return QVector2D(0, -1);
        break;
    case Qt::Key_Down:
    case Qt::Key_S:
//        hero->setProperty("newDirection", QVector2D(0, 1));
//        QMetaObject::invokeMethod(spriteSequence, "jumpTo", Q_ARG(QString, "down"));
        return QVector2D(0, 1);
        break;
    case Qt::Key_Escape:
        QMetaObject::invokeMethod(hero, "exit");
    }
}
