import Quickshell
import Quickshell.Io
import QtQuick
import "widgets"
import "popups"

Scope {
  id: root
  property string time

  // Variants {
  //   model: Quickshell.screens

    PanelWindow {
      id: panel
      required property var modelData
      screen: modelData

      color: "red"

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      ClockWidget {
        anchors.centerIn: parent
      }

      BatteryWidget {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 10
      }

      WifiPopup {
        id: wifiPopup
        panel: panel    
      }

      WifiWidget {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 10
        popup: wifiPopup
      }
    }
  // }
}
