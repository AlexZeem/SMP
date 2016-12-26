import QtQuick 2.0
import QtQuick.Controls 1.3

Item {
    id: root
    anchors.fill: parent

    Text {
        id: fileName
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        text: context.selectedFileUrls ? context.selectedFileUrls[0]: ""
    }

    Button {
        id: someBtn
        text: "SOme btn"
        onClicked: {
            console.log("Do something", fileName.text)
            aplayer.doSomething(fileName.text)
        }
    }

    Row {
        anchors.top: someBtn.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            id: diods
            model: aplayer.byte.length

            Rectangle {
                height: 25
                width: 25
                border.width: 1
                radius: 10
                color: (index < aplayer.byte.length) ? aplayer.byte[index] : "white"
            }
        }
    }
}

