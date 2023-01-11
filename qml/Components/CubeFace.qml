import QtQuick
import QtQuick3D

import Cube 1.0

Model {
    id: cube
    scale: Qt.vector3d(xExtent === 1 ? xExtent : xExtent - 0.05,
                       yExtent === 1 ? yExtent : yExtent - 0.05,
                       zExtent === 1 ? zExtent : zExtent - 0.05)
    position: Qt.vector3d(x, y, z)
    materials: [material]
    source: "#Cube"

    onPositionChanged: console.log("position:", position)

    property real x: 0
    property real xExtent: 0

    property real y: 0
    property real yExtent: 0

    property real z: 0
    property real zExtent: 0

    property int color: Color.White

    property PrincipledMaterial material: {
        switch (color) {
        case Color.White:  return whiteMaterial
        case Color.Green:  return greenMaterial
        case Color.Red:    return redMaterial
        case Color.Blue:   return blueMaterial
        case Color.Orange: return orangeMaterial
        case Color.Yellow: return yellowMaterial
        }
    }

    PrincipledMaterial {
        id: whiteMaterial
        baseColor: "#FFFFFF"
    }

    PrincipledMaterial {
        id: greenMaterial
        baseColor: "#45BB6D"
    }

    PrincipledMaterial {
        id: redMaterial
        baseColor: "#FD595A"
    }

    PrincipledMaterial {
        id: blueMaterial
        baseColor: "#0097e8"
    }

    PrincipledMaterial {
        id: orangeMaterial
        baseColor: "orange"
    }

    PrincipledMaterial {
        id: yellowMaterial
        baseColor: "#fff001"
        alphaMode: PrincipledMaterial.Opaque
    }
}
