import QtQuick 2.5
import QtQuick.Window 2.2
import "extra"
Window {
    visible: true

    MenuView
    {
        anchors.fill: parent
        onItemClick:
        {
            picPanel.show(index)
        }
    }

    QxPicPanel
    {
        id: picPanel
        anchors.fill: parent
        visible: false
        onItemClick:
        {
            picMax.show(index)
        }
    }

    QxPicMax
    {
        id: picMax
        anchors.fill: parent
    }
}

