import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    id: win
    visible: true
    width: 800
    height: 730
//    flags:  Qt.FramelessWindowHint
    color: "black"
//    visibility: Window.FullScreen
    Image {
        id: showimage
        source: "file:"+HomeLocation.HomePath+"/image/img/1.jpg"
        anchors.fill: parent
    }

    Rectangle{
        id: roundmenu
        height: 50
        width: parent.width
        x: 10
        y: 10
        color: "#00000000"

        RoundButton{
            id: roundbt1
            property string inputText: "open"
            visible: false
            state: "one"
            getMouseArea.onClicked: {
                coverflow2.visible = true
                changeClose1.start()
                changeClose2.start()
                changeClose3.start()
                menubt.state = "close"
                image1.source = "file:"+HomeLocation.HomePath+"/image/icons8-menu-64.png"
            }
        }
        RoundButton{
            id: roundbt2
            property string inputText: "close"
            visible: false
            getMouseArea.onClicked: {
                coverflow2.visible = false
                changeClose1.start()
                changeClose2.start()
                changeClose3.start()
                menubt.state = "close"
                image1.source = "file:"+HomeLocation.HomePath+"/image/icons8-menu-64.png"
            }
        }
        RoundButton{
            id: roundbt3
            property string inputText: "quit"
            visible: false
            getMouseArea.onClicked: {
                Qt.quit();
            }
        }

        Rectangle{
            id: menubt
            width: parent.height
            height: parent.height
            radius: 100
            state: "close"
            Image {
                id: image1
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                rotation: -180
                source: "file:"+HomeLocation.HomePath+"/image/icons8-menu-64.png"
            }

            NumberAnimation {
                id: menuChange1
                target: image1
                to: image1.rotation -180
                property: "rotation"
                duration: 100
                easing.type: Easing.InOutQuad
            }

            IconButtonAnimation{
                id:changeOpen1
                target: roundbt1
                property int toValue: (menubt.width+10)*1
            }
            IconButtonAnimation{
                id:changeOpen2
                target: roundbt2
                property int toValue: (menubt.width+10)*2
            }
            IconButtonAnimation{
                id:changeOpen3
                target: roundbt3
                property int toValue: (menubt.width+10)*3
            }
            IconButtonAnimation{
                id:changeClose1
                target: roundbt1
                property int toValue: 10
                getOnRunningChanged.onRunningChanged: {
                    if(running == false)roundbt1.visible = false
                }
            }
            IconButtonAnimation{
                id:changeClose2
                target: roundbt2
                property int toValue: 10
                getOnRunningChanged.onRunningChanged: {
                    if(running == false)roundbt2.visible = false
                }
            }
            IconButtonAnimation{
                id:changeClose3
                target: roundbt3
                property int toValue: 10
                getOnRunningChanged.onRunningChanged: {
                    if(running == false)roundbt3.visible = false
                }
            }


            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(menubt.state == "close"){
                        roundbt1.visible = true
                        roundbt2.visible = true
                        roundbt3.visible = true
                        image1.source = "file:"+HomeLocation.HomePath+"/image/icons8-cancel-32.png"
                        changeOpen1.start()
                        changeOpen2.start()
                        changeOpen3.start()
                        menubt.state = "open"

                    }else{
                        image1.source = "file:"+HomeLocation.HomePath+"/image/icons8-menu-64.png"
                        changeClose1.start()
                        changeClose2.start()
                        changeClose3.start()
                        menubt.state = "close"
                    }
                }
            }
        }
    }

    CoverFlow2{
        id: coverflow2
        property string homepath: HomeLocation.HomePath
        anchors.top: roundmenu.bottom
        anchors.topMargin: 10
        width: parent.width
        height: 150
        color: "#10363636"
        visible: false
        getPathView.onMovingChanged: {
            if(!getPathView.moving){
                showimage.source = "file:"+HomeLocation.HomePath+"/image/img/"+(getPathView.currentIndex+1)+".jpg"
                showimage.visible = true
            }
        }
        getPathView.onCurrentIndexChanged: {
            if(!getPathView.moving){
                showimage.source = "file:"+HomeLocation.HomePath+"/image/img/"+(getPathView.currentIndex+1)+".jpg"
            }
        }
        getPathView.onDragStarted:{
            showimage.visible = false
        }
    }
}
