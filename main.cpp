#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "herocontroller.h"
#include "levelmanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setOrganizationName("NM Company");
    app.setOrganizationDomain("nkmtn.com");
    app.setApplicationName("Pac-Man");

    QQmlApplicationEngine engine;
    HeroController heroController;
    engine.rootContext()->setContextProperty("heroController", &heroController);
    LevelManager levelManager;
    engine.rootContext()->setContextProperty("levelManager", &levelManager);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
