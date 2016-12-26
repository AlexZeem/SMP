import QtQuick 2.0
import QtQuick.Dialogs 1.0

FileDialog {
    id: fileDialog
    title: "Please choose a file"
    nameFilters: [ "Music files (*.mp3)", "All files (*)" ]
}
