#ifndef MAINWINDOWS_H
#define MAINWINDOWS_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QString>
#include <QStandardPaths>
#include <QQmlContext>
#include <QDebug>

class MainWindows : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString HomePath READ HomePath WRITE setHomePath NOTIFY HomePathChanged)
public:
    explicit MainWindows(QObject *parent = nullptr);
    void setHomePath(QString desk){};
    QString HomePath(){
        return _HomePath;
    }

signals:
    void HomePathChanged();

public slots:

private:
    QQmlApplicationEngine engine;
    QString _HomePath;

};

#endif // MAINWINDOWS_H
