import QtQuick
import Quickshell
import Quickshell.Networking

Rectangle {
  required property PopupWindow popup

  color: "#1E2326"

  MouseArea {
    anchors.fill: parent

    implicitWidth: 30
    implicitHeight: 30

    onClicked: {
      popup.visible = !popup.visible
    }
  }
}
