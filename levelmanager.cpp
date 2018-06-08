#include "levelmanager.h"
#include <QDebug>
#include <QRandomGenerator>

LevelManager::LevelManager(QObject *parent) : QObject(parent)
{

}

QVector2D LevelManager::handleCollisions(QObject *hero, QVariantList arr)
{
    QVariant variant = hero->property("direction");
    QVector2D direction = qvariant_cast<QVector2D>(variant);

    int x = hero->property("x").toInt();
    int y = hero->property("y").toInt();
    if (x < 24 || x > 15 * 48 - 36 || y < 24 || y > 15 * 48 - 36)
        return direction;
    if (y / 48 + (int)direction.y() > 14 || x / 48 + (int)direction.x() > 14)
        return direction;
    int ind = (y / 48 + (int)direction.y()) * 15 + x / 48 + (int)direction.x();

    while (arr[ind].toInt() != 7) {
        int r = QRandomGenerator::global()->bounded(4);
        switch (r) {
        case 0: direction = QVector2D(1, 0); break;
        case 1: direction = QVector2D(-1, 0); break;
        case 2: direction = QVector2D(0, 1); break;
        case 3: direction = QVector2D(0, -1); break;
        }
        ind = (y / 48 + (int)direction.y()) * 15 + x / 48 + (int)direction.x();
    }

    return direction;
}
