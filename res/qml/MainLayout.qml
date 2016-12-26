import QtQuick 2.4
import QtQuick.Controls 1.3
import "dialogs"

Item {
    id: root
    anchors.fill: parent

    OpenFile {
        id: fileDialog

        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
            context.selectedFileUrls = fileDialog.fileUrls
        }
        onRejected: {
            console.log("Canceled")
        }
    }

    Row {
        id: topMenu

        Button {
            text: "Open"
            onClicked: {
                console.log("Open file dialog...")
                context.selectedFileUrls = null
                fileDialog.open()
            }
        }

        Button {
            text: "Player"
            onClicked: {
                console.log("Open music player...")
                signals.openMusicPlayer()
            }
        }
    }

    Text {
        anchors.top: topMenu.bottom
        text: context.selectedFileUrls ? context.selectedFileUrls[0]: ""
    }
}
