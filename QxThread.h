#ifndef QXTHREAD_H
#define QXTHREAD_H
#include <QObject>
#include <QThread>
#include <QVector>
class QxThread : public QThread
{
public:
    QxThread( QObject * parent );
    void run();
private:
    QVector vector;
};

#endif // QXTHREAD_H
