#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>

#include "audio/Player.h"

int main(int argc, char *argv[])
{
    QGuiApplication guiApp(argc, argv);

    audio::Player _aplayer;
    QQuickView view;
    view.rootContext()->setContextProperty("aplayer", &_aplayer);
    //for transparency
    QQuickWindow::setDefaultAlphaBuffer(true);
    view.setColor(Qt::transparent);
    //------------

    view.setSource(QUrl(QStringLiteral("res/qml/main.qml")));
    view.setPosition(0,0);
    view.show();
    view.raise();

    return guiApp.exec();
}
