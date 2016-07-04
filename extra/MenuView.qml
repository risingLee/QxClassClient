import QtQuick 2.0

Rectangle {
    signal itemClick(var index)
    ListView
    {
        id: listMenuView
        anchors.fill: parent
        delegate: listMenuDelegate
        model: listMenuModel
    }

    ListModel
    {
        id: listMenuModel
        ListElement
        {
            name: "1.doc"
            src: "www.baidu.com"
        }
        ListElement
        {
            name: "2.ppt"
            src: "www.sina.com"
        }
    }

    Component{
        id: listMenuDelegate
        Rectangle
        {
            width: parent.width
            height: 20
            color: "gray"
            border.width: 1
            border.color: "black"
            Text
            {
                anchors.centerIn: parent
                color: "white"
                text: name
            }
            MouseArea
            {
                anchors.fill: parent
                onPressed:
                {
                    parent.color = "white"
                }

                onClicked:
                {
                    parent.color = "gray"
                    itemClick(index)
                }
            }
        }
    }
}
