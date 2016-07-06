#include "PaintedItem.h"
#include <QPainter>
#include <QPen>
#include <QBrush>
#include <QColor>
#include <QDebug>

PaintedItem::PaintedItem(QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , m_element(0)
    , m_bEnabled(true)
    , m_bPressed(false)
    , m_bMoved(false)
    , m_pen(Qt::black)
{
    m_pen.setCapStyle(Qt::RoundCap);
    setPenWidth(4);
    setAcceptedMouseButtons(Qt::LeftButton);
    m_thread = new QxThread(this);
    connect(this, SIGNAL(sig_Position(QLineF)), this, SLOT(onPosition(QLineF)));
    connect(m_thread, SIGNAL(test(QString)), this, SLOT(onTest(QString)));
    m_thread->start();
}

PaintedItem::~PaintedItem()
{
    purgePaintElements();
}

void PaintedItem::clear()
{
    purgePaintElements();
    update();
}

void PaintedItem::undo()
{
    if(m_elements.size())
    {
        delete m_elements.takeLast();
        update();
    }
}

void PaintedItem::paint(QPainter *painter)
{
    painter->setRenderHint(QPainter::Antialiasing);

    int size = m_elements.size();
    ElementGroup *element;
    for(int i = 0; i < size; ++i)
    {
        element = m_elements.at(i);
        painter->setPen(element->m_pen);
        painter->drawLines(element->m_lines);
    }
}

void PaintedItem::mousePressEvent(QMouseEvent *event)
{
    m_bMoved = false;
    if(!m_bEnabled || !(event->button() & acceptedMouseButtons()))
    {
        QQuickPaintedItem::mousePressEvent(event);
    }
    else
    {
        //qDebug() << "mouse pressed";
        m_bPressed = true;
        m_element = new ElementGroup(m_pen);
        m_elements.append(m_element);
        m_lastPoint = event->localPos();
        event->setAccepted(true);
    }
}


void PaintedItem::onPosition(QLineF pos)
{
    m_element->m_lines.append(pos);
    if(m_element->m_lines.length() % 3 == 0)
        update();
}

void PaintedItem::onTest(QString test)
{
    qDebug()<<test;
}

void PaintedItem::mouseMoveEvent(QMouseEvent *event)
{
    if(!m_bEnabled || !m_bPressed || !m_element)
    {
        QQuickPaintedItem::mousePressEvent(event);
    }
    else
    {
        emit sig_Position(QLineF(m_lastPoint, event->localPos()));
        m_lastPoint = event->localPos();
    }
}

void PaintedItem::mouseReleaseEvent(QMouseEvent *event)
{
    if(!m_element || !m_bEnabled || !(event->button() & acceptedMouseButtons()))
    {
        QQuickPaintedItem::mousePressEvent(event);
    }
    else
    {
        //qDebug() << "mouse released";
        m_bPressed = false;
        m_bMoved = false;
        m_element->m_lines.append(QLineF(m_lastPoint, event->localPos()));
        update();
    }
}

void PaintedItem::purgePaintElements()
{
    int size = m_elements.size();
    if(size > 0)
    {
        for(int i = 0; i < size; ++i)
        {
            delete m_elements.at(i);
        }
        m_elements.clear();
    }
    m_element = 0;
}
