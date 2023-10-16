import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4 as Old
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
Rectangle {
    Rectangle{
        height:parent.height* 0.9
        width: parent.width * 0.9

        Grid{
            columns: 2
            rows:      2
            Rectangle{
                id:firstRect
                height: globals.height
                width:  globals.width
                Rectangle{
                    height: parent.height * 0.9
                    width:  parent.width  * 0.9
                    color: "#cc0099"
                    opacity:  0.9
                    radius:  height/10
                    anchors.centerIn: parent
                    ColumnLayout {
                          anchors.fill: parent
                        Old.Calendar {
                          id: calendar
                          style: CalendarStyle {
                              gridVisible: true
                          dayOfWeekDelegate: Rectangle {
                              color: gridVisible ? "#fcfcfc" : "transparent"
                              implicitHeight: Math.round(TextSingleton.implicitHeight * 2.25)
                              Label {
                                  text: control.locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
                                  anchors.centerIn: parent
                              }
                          }
                            navigationBar: Rectangle {
                              height: Math.round(TextSingleton.implicitHeight * 2.73)
                              color: "#f9f9f9"

                              Rectangle {
                                  color: Qt.rgba(1,1,1,0.6)
                                  height: 1
                                  width: parent.width
                              }

                              Rectangle {
                                  anchors.bottom: parent.bottom
                                  height: 1
                                  width: parent.width
                                  color: "#ddd"
                              }

//                              HoverButton {
//                                  id: previousMonth
//                                  width: parent.height
//                                  height: width
//                                  anchors.verticalCenter: parent.verticalCenter
//                                  anchors.left: parent.left
//                                  source: "./assets/leftanglearrow.png"
//                                  onClicked: control.showPreviousMonth()
//                              }
                              Label {
                                  id: dateText
                                  text: styleData.title
                                  elide: Text.ElideRight
                                  horizontalAlignment: Text.AlignHCenter
                                  font.pixelSize: TextSingleton.implicitHeight * 1.25
                                  anchors.verticalCenter: parent.verticalCenter
                                  anchors.left: previousMonth.right
                                  anchors.leftMargin: 2
                                  anchors.right: nextMonth.left
                                  anchors.rightMargin: 2
                              }
//                              HoverButton {
//                                  id: nextMonth
//                                  width: parent.height
//                                  height: width
//                                  anchors.verticalCenter: parent.verticalCenter
//                                  anchors.right: parent.right
//                                  source: "./assets/rightanglearrow.png"
//                                  onClicked: control.showNextMonth()
//                              }
                            }
                          }
                        }
                      }
                }

            }
            Rectangle{
                id:secondRect
                height: globals.height
                width:  globals.width
                border.color:  "black"
                SwipeView {
                    id: viewTwo

                    currentIndex: 0
                    anchors.fill: parent

                    PageTwo {
                    }
                    PageThree {
                    }
                }

                PageIndicator {
                    id: indicatorTwo

                    count: viewTwo.count
                    currentIndex: viewTwo.currentIndex

                    anchors.bottom: viewTwo.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Rectangle{
                id: thirdRect
                height: globals.height
                width:  globals.width
                border.color:  "black"
                SwipeView {
                    id: viewThree

                    currentIndex: 0
                    anchors.fill: parent

                    //                    PageTwo {
                    //                    }
                    //                    PageThree {
                    //                    }
                }

                PageIndicator {
                    id: indicatorThree

                    count: viewThree.count
                    currentIndex: viewThree.currentIndex

                    anchors.bottom: viewThree.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Rectangle{
                id:fourRect
                height: globals.height
                width:  globals.width
                border.color:  "black"
                SwipeView {
                    id: viewFour

                    currentIndex: 0
                    anchors.fill: parent

                    //                    PageTwo {
                    //                    }
                    //                    PageThree {
                    //                    }
                }

                PageIndicator {
                    id: indicatorFour

                    count: viewFour.count
                    currentIndex: viewFour.currentIndex

                    anchors.bottom: viewFour.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

}
