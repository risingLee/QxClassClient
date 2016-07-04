import QtQuick 2.5
import QtQuick.Window 2.2
import "extra"
Window {
    visible: true
    width: Screen.width
    height: Screen.height
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
            picMax.show(src)
        }
    }

    QxPicMax
    {
        id: picMax
        anchors.fill: parent
    }
}

