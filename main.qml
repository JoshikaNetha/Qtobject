import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
Window {
    id:                 root
    width:              Screen.width * 0.8
    height:             Screen.height * 0.8
    visible:            true
    title:              qsTr("Hello World")
    QtObject{
        id:                  globals
        property real height: root.height * 0.5 //20
        property real width:  root.width * 0.5  //100
    }
    SwipeView {
        id: view

        currentIndex: 0
        anchors.fill: parent

        PageOne {
            id: firstPage
        }
//        PageTwo {
//            id: secondPage
//        }
//        PageThree {
//            id: thirdPage
//        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
