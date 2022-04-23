#include <QCoreApplication>
#include <QTimer>
#include <iostream>
using namespace std;

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    // do your thing, once
    cout << "Hello world\n";

    QTimer::singleShot(0, &app, &QCoreApplication::quit);
    return app.exec();
}