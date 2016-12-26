import QtQuick 2.4

FocusScope {
    id: main
    focus: true
    width: 640
    height: 480

    Context {
        id: context
    }

    Signals {
        id: signals
    }

    StateManager {
        id: mainStateManager
    }

    Loader {
        id: mainLoader
        anchors.fill: parent
    }
}
