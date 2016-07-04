import QtQuick 2.0

Rectangle {

    visible: false
    color: "red"
    signal itemClick(var src)
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
            name: "pic1"
            src: "http://pic14.nipic.com/20110615/1347158_233357498344_2.jpg"
        }
        ListElement
        {
            name: "pic2"
            src: "http://pic35.nipic.com/20131105/6704106_015313024000_2.jpg"
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
                    itemClick(src)
                }
            }
        }
    }
    function show(index)
    {
        getIndex(index)
        visible = true
    }

    function getIndex(index)
    {
        // append Model
    }
}

