#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>

#include "Controller/membermodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<MemberModel>("MemberListModel", 1, 0, "MemberListModel");

    QQmlApplicationEngine engine;

    MemberModel memberModel;
    for (int i = 1; i < 10; i++){
        QString a = "Name" + QString::number(i);
        QString b = "Rank" + QString::number(i);
        QString c = "Domain" + QString::number(i);
        QString d = "Age" + QString::number(i);
        QString e = "Gender" + QString::number(i);
        QString f = "Allocated" + QString::number(i);

        Menber member(a, b, c, d, e, f);
        memberModel.add(member);
    }
    engine.rootContext()->setContextProperty("memberModel", &memberModel);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
