import Quickshell // for PanelWindow
import QtQuick // for Text

PanelWindow {
  anchors {
    top: true
    right: true
    left: true
  }

  implicitHeight: 30

  Text {
    anchors.centerIn: parent
    text: "Hello World!"
  }
}
