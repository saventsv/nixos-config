import Quickshell
import QtQuick

PopupWindow {
  required property PanelWindow panel

  anchor.window: panel
  color: "#1E2326"

  implicitWidth: 300
  implicitHeight: 400

  Rectangle {
    color: "#1E2326"
    anchors.fill: parent
    radius: 12

    Text {
      anchors.centerIn: parent
      text: "Hello"
    }
  }
}
