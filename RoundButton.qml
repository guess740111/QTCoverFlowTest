import QtQuick 2.0

Rectangle{
    height: parent.height
    width: parent.height
    radius: 100

    property alias getMouseArea: m

    Text {
        id: name
        text: qsTr(inputText)
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20
        color: "#000000"
    }

    MouseArea{
        anchors.fill: parent
        id: m
    }
}
