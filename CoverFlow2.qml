import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {
    visible: true
    property alias getPathView: view


    PathView {
        id: view
        property int itemAngle: 40.0
        property int itemSize: width/3.5

        height: parent.height
        width: parent.width
        pathItemCount: 13
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        interactive: true
        model: spaceMen
        delegate: viewDelegate

//        onDragStarted: {
//            scrollViewAnimation.stop()
//        }


        NumberAnimation on offset {
            id: scrollViewAnimation
            duration: 500
            easing.type: Easing.InOutQuad
        }


        path: Path {
            startX: 0
            startY: view.height / 2
            PathPercent { value: 0.0 }
            PathAttribute { name: "z"; value: 0 }
            PathAttribute { name: "angle"; value: view.itemAngle }
            PathAttribute { name: "origin"; value: 0 }


            PathLine {x: view.width*0.4; y: view.height / 2}
            PathPercent { value: 0.45 }
            PathAttribute { name: "angle"; value: view.itemAngle }
            PathAttribute { name: "origin"; value: 0 }
            PathAttribute { name: "z"; value: 10 }


            PathLine { relativeX: 0; relativeY: 0 }
            PathAttribute { name: "angle"; value: 0.0 }
            PathAttribute { name: "origin"; value: 0 }
            PathAttribute { name: "z"; value: 10 }


            PathLine {x: view.width*0.6; y: view.height / 2}
            PathPercent { value: 0.55 }
            PathAttribute { name: "angle"; value: 0.0 }
            PathAttribute { name: "origin"; value: 0 }
            PathAttribute { name: "z"; value: 10 }


            PathLine { relativeX: 0; relativeY: 0 }
            PathAttribute { name: "angle"; value: -view.itemAngle }
            PathAttribute { name: "origin"; value: view.itemSize }
            PathAttribute { name: "z"; value: 10 }


            PathLine {x: view.width; y: view.height / 2}
            PathPercent { value: 1 }
            PathAttribute { name: "angle"; value: -view.itemAngle }
            PathAttribute { name: "origin"; value: view.itemSize }
            PathAttribute { name: "z"; value: 0 }
        }

    }

    Component {
        id: viewDelegate
        Rectangle {
            id: flipItem
            width: view.itemSize
            height: view.height
            color: "white"
            z: PathView.z

            property var rotationAngle: PathView.angle
            property var rotationOrigin: PathView.origin

            transform:
                Rotation {
                id: rot
                axis { x: 0; y: 1; z: 0 }
                angle: rotationAngle
                origin.x: rotationOrigin
                origin.y: width
            }


            Rectangle {
                border.color: "black"
                border.width: 2
                anchors.top: flipItem.top
                anchors.left: flipItem.left
                anchors.right: flipItem.right
                width: flipItem.width
                height: flipItem.height
                smooth: true
                antialiasing: true
                Image{
                    id:image
                    anchors.fill: parent
                    anchors.centerIn: parent
                    sourceSize.width: 240
                    sourceSize.height: 240
                    source: "file:"+homepath+"/image/img/"+(tmpid+1)+".jpg"
                }
                ShaderEffect {
                    anchors.top: image.bottom
                    width: image.width
                    height: image.height;
                    anchors.left: image.left
                    property variant source: image;
                    property size sourceSize: Qt.size(0.5 / image.width, 0.5 / image.height);
                    fragmentShader:
                            "varying highp vec2 qt_TexCoord0;
                            uniform lowp sampler2D source;
                            uniform lowp vec2 sourceSize;
                            uniform lowp float qt_Opacity;
                            void main() {

                                lowp vec2 tc = qt_TexCoord0 * vec2(1, -1) + vec2(0, 1);
                                lowp vec4 col = 0.25 * (texture2D(source, tc + sourceSize) + texture2D(source, tc- sourceSize)
                                + texture2D(source, tc + sourceSize * vec2(1, -1))
                                + texture2D(source, tc + sourceSize * vec2(-1, 1)));
                                gl_FragColor = col * qt_Opacity * (1.0 - qt_TexCoord0.y) * 0.2;
                            }"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        view.currentIndex = tmpid
                    }
                }
            }
        }
    }

    ListModel {
            id: spaceMen

            ListElement { tmpid: 0;}
            ListElement { tmpid: 1; }
            ListElement { tmpid: 2; }
            ListElement { tmpid: 3; }
            ListElement { tmpid: 4; }
            ListElement { tmpid: 5; }
            ListElement { tmpid: 6; }
            ListElement { tmpid: 7; }
            ListElement { tmpid: 8; }
            ListElement { tmpid: 9; }
            ListElement { tmpid: 10; }
            ListElement { tmpid: 11; }
            ListElement { tmpid: 12; }
        }
}
