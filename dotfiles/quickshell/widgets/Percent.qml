pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  property string percent

  Process {
    id: batteryProc
    running: true
    command: ["sh", "-c", "upower -b | grep percent | cut -d : -f2 | sed 's/ //g'"]

    stdout: StdioCollector {
      onStreamFinished: root.percent = this.text
    }
  }

  Timer {
    interval: 5000
    running: true
    repeat: true
    onTriggered: batteryProc.running = true
  }
}
