import QtQuick 2.0
import an.qml.Controls 1.0

Image
{
    property string firstSrc: ""
    property string lastSrc: ""
    source: ""
    visible: false
    function show(src)
    {
        source = src
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


