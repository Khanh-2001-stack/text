import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import "ui/MainScreen"

Window {
    id: win
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    StackView {
        id: stackView
        property real offset: 10
        width: 100; height: 100

//        initialItem: "qrc:/ui/MainScreen/mainscreen.qml"
        initialItem: "qrc:/ui/MainScreen/mainscreen.qml"

        pushEnter: Transition {
            id: pushEnter

            ParallelAnimation {
                PropertyAction {
                    property: "x"
                    value: pushEnter.ViewTransition.item.pos
                }

                NumberAnimation {
                    properties: "y"
                    from: pushEnter.ViewTransition.item.pos + stackView.offset
                    to: pushEnter.ViewTransition.item.pos + 0.0
                    duration: 400
                    easing.type: Easing.OutCubic
                }

                NumberAnimation {
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 400
                    easing.type: Easing.OutCubic
                }
            }
        }
        popExit: Transition {
            id: popExit
            ParallelAnimation {
                PropertyAction {
                    property: "x"
                    value: popExit.ViewTransition.item.pos
                }

                NumberAnimation {
                    properties: "y"
                    from: popExit.ViewTransition.item.pos + 0.0
                    to: popExit.ViewTransition.item.pos + stackView.offset
                    duration: 400
                    easing.type: Easing.OutCubic
                }
                NumberAnimation {
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 400
                    easing.type: Easing.OutCubic
                }
            }
        }

        pushExit: Transition {
            id: pushExit
            PropertyAction { property: "x"; value: pushExit.ViewTransition.item.pos }
            PropertyAction { property: "y"; value: pushExit.ViewTransition.item.pos }
        }
        popEnter: Transition {
            id: popEnter
            PropertyAction { property: "x"; value: popEnter.ViewTransition.item.pos }
            PropertyAction { property: "y"; value: popEnter.ViewTransition.item.pos }
        }
    }
}
