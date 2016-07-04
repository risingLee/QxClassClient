import QtQuick 2.0
import an.qml.Controls 1.0

Image
{
    property string firstSrc: ""
    property string lastSrc: ""
    source: "http://pic14.nipic.com/20110615/1347158_233357498344_2.jpg"
    visible: false
    function show(index)
    {
        visible = true
    }

    MouseArea
    {
        anchors.fill: parent
        property int lastX: 0
        property int lastY: 0
        onPressed:
        {
            lastX = mouseX
            lastY = mouseY
        }
        onPositionChanged:
        {
            console.log(mouseX, mouseY)
        }
        onReleased:
        {

        }
    }
    APaintedItem {
        id: painter;
        anchors.fill: parent
    }
}


