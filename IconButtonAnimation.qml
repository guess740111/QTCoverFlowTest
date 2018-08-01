import QtQuick 2.0

NumberAnimation {
    property alias getOnRunningChanged: animationmain

    id: animationmain
    to:toValue
    property: "x"
    duration: 500
    easing.type: Easing.InOutQuad
}
