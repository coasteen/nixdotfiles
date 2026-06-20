import Quickshell
import Quickshell.Wayland
import QtQuick

Variants {
	model: Quickshell.screens
	delegate: WlrLayershell {
		id: root
		layer: WlrLayer.Background
		required property ShellScreen modelData
		screen: modelData
		exclusionMode: ExclusionMode.Ignore

		anchors: {
			top: true
			bottom: true
			left: true
			right: true
		}
		Image {
			cache: true
			anchors.fill: parent
			source: "/home/coast/Wallpapers/nature2art.png"
		}
	}
}
