import QtQuick 2.0
import QtQuick.Controls 1.3

Item {
    id: root
    anchors.fill: parent

    Text {
        anchors.centerIn: parent
        text: context.selectedFileUrls ? context.selectedFileUrls[0]: "No file selected"
    }
}

