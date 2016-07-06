#ifndef QXTHREAD_H
#define QXTHREAD_H
#include <QObject>
#include <QThread>
#include <QLineF>
#include <QVector>
class QxThread : public QThread
{
    Q_OBJECT
public:
    QxThread( QObject * parent );
    QVector<QLineF> vector;
    void run();
signals:
    void sig_Position(QLineF pos);
    void test(QString test);
};

#endif // QXTHREAD_H
