import QtQuick 2.0
import QtQml.StateMachine 1.0

StateMachine {
    id: stateMachine
    initialState: init
    running: true

    State {
        id: init

        SignalTransition {
            targetState: player
            signal: signals.openMusicPlayer
        }

        onEntered: {
            console.log("init entered")
            mainLoader.setSource("mainlayout.qml")
        }

        onExited: {
            console.log("init exited")
        }
    }

    State {
        id: player

        onEntered: {
            console.log("player entered")
            mainLoader.setSource("musicplayer/main.qml")
        }

        onExited: {
            console.log("player exited")
        }
    }
}

