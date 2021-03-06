import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: label
        anchors.centerIn: parent
        //% "Storeman"
        text: qsTrId("orn-storeman")
    }

    CoverActionList {
        id: coverAction
        enabled: networkManager.state === "online"

        CoverAction {
            iconSource: "image://theme/icon-cover-search"
            onTriggered: {
                const searchOnPageStack = pageStack.find(function(page) {
                    return page.toString().substr(0, 10) === "SearchPage"
                })
                if (searchOnPageStack) {
                    pageStack.pop(searchOnPageStack, PageStackAction.Immediate)
                } else {
                    pageStack.push(Qt.resolvedUrl("../pages/SearchPage.qml"), {}, PageStackAction.Immediate)
                }
                __silica_applicationwindow_instance.activate()
            }
        }

    }
}

