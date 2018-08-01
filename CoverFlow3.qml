import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {
    visible: true
    PathView {
        id: view
        width: parent.width
        height: parent.height
        model: model1
        delegate: Item {
            id: wrapper
            width: view.width/10
            height: view.height
            scale: PathView.scale
            Image {
                width: parent.width
                height: view.height
                source: iconSource
            }
        }
        path: Path {
            startX: 0
            startY: view.height/2
            PathAttribute { name: "scale"; value: 0.3 }
            PathLine { x: view.width/4; y: view.height/2 }
            PathAttribute { name: "scale"; value: 0.6 }
            PathLine { x: view.width*2/4; y: view.height/2 }
            PathAttribute { name: "scale"; value: 1.0 }
            PathLine { x: view.width*3/4; y: view.height/2 }
            PathAttribute { name: "scale"; value: 0.6 }
            PathLine { x: view.width*4/4; y: view.height/2 }
            PathAttribute { name: "scale"; value: 0.3 }
        }
    }

    ListModel {
        id: model1
        ListElement { title: "Calendar"; iconSource: "img/1.png" }
        ListElement { title: "Setup"; iconSource: "img/2.png" }
        ListElement { title: "Internet"; iconSource: "img/3.png" }
        ListElement { title: "Messages"; iconSource: "img/4.png" }
        ListElement { title: "Music"; iconSource: "img/5.png" }
        ListElement { title: "Call"; iconSource: "img/6.png" }
        ListElement { title: "PodCast"; iconSource: "img/7.png" }
        ListElement { title: "Recycle"; iconSource: "img/8.png" }
    }

}
