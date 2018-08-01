#include <QApplication>
#include <QQmlApplicationEngine>
#include "mainwindows.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    MainWindows mainwindows;
    return app.exec();
}
