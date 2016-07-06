#include "QxThread.h"

QxThread::QxThread( QObject * parent )
{

}
void QxThread::run()
{
    while(1)
    {

        if(vector.length() > 0)
        {
            emit test("0");
            QLineF f = vector.first();

            emit sig_Position(f);
            vector.removeFirst();
        }
    }
}
