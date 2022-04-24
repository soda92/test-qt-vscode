#include <QCoreApplication>
#include <QTimer>
#include <fmt/core.h>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    // do your thing, once
    fmt::print("Hello world\n");

    QTimer::singleShot(0, &app, &QCoreApplication::quit);
    return app.exec();
}
