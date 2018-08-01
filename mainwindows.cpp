#include "mainwindows.h"

MainWindows::MainWindows(QObject *parent) : QObject(parent)
{
    _HomePath = QStandardPaths::writableLocation(QStandardPaths::HomeLocation);
    engine.rootContext()->setContextProperty("HomeLocation",this);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
}
