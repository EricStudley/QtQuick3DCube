import QtQuick
import QtQuick3D

import Cube 1.0

Node {
    id: cubeCell
    scale: Qt.vector3d(cellSize - 0.01, cellSize - 0.01, cellSize - 0.01)
    position: matrix.column(3).toVector3d()

    property alias model: model.model

    property matrix4x4 matrix

    property vector3d rotationAxis: Qt.vector3d(0, 0, 0)

    property real rotationAngle: 0

    onRotationAngleChanged: {
//        cubeCell.position = animation.initialPosition.column(3).toVector3d()
        rotateAroundAxis(rotationAngle, rotationAxis)
    }

    function rotateAroundAxis(angle, axis) {
        var m = Qt.matrix4x4()
        m.rotate(angle, axis)
        matrix = m.times(matrix)
    }

    Connections {
        target: cubeModel

        function onRotateCell(cellIndex, axis, instant) {
            if (index === cellIndex) {

//                if (instant) {
                    cubeCell.position = cubeCell.matrix.column(3).toVector3d()
                    rotationAxis = axis
                    rotationAngle = 90
//                }
//                else {
//                    rotationAxis = axis
//                    animation.restart()
//                }
            }
        }
    }

//    SequentialAnimation {
//        id: animation

//        property matrix4x4 initialPosition: Qt.matrix4x4()

//        ScriptAction { script: animation.initialPosition = cubeCell.sceneTransform }

//        PropertyAnimation {
//            target: cubeCell
//            property: "rotationAngle"
//            from: 0
//            to: 90
//            duration: 100
//        }

//        ScriptAction { script: cubeCell.position = cubeCell.matrix.column(3).toVector3d() }
//    }

    Repeater3D {
        id: model

        CubeFace {
            x:       switch (modelData) {
                     case Side.Right: return 100 / 2
                     case Side.Left:  return -(100 / 2)
                     default: return 0
                     }
            xExtent: switch (modelData) {
                     case Side.Up:    return 1
                     case Side.Front:  return 1
                     case Side.Right:  return 0.01
                     case Side.Back:   return 1
                     case Side.Left:   return 0.01
                     case Side.Down: return 1
                     }

            y:       switch (modelData) {
                     case Side.Up:    return 100 / 2
                     case Side.Down: return -(100 / 2)
                     default: return 0
                     }
            yExtent: switch (modelData) {
                     case Side.Up:    return 0.01
                     case Side.Front:  return 1
                     case Side.Right:  return 1
                     case Side.Back:   return 1
                     case Side.Left:   return 1
                     case Side.Down: return 0.01
                     }

            z:       switch (modelData) {
                     case Side.Front: return 100 / 2
                     case Side.Back:  return -(100 / 2)
                     default: return 0
                     }
            zExtent: switch (modelData) {
                     case Side.Up:    return 1
                     case Side.Front:  return 0.01
                     case Side.Right:  return 1
                     case Side.Back:   return 0.01
                     case Side.Left:   return 1
                     case Side.Down: return 1
                     }
            color:   switch (modelData) {
                     case Side.Up:    return Color.White
                     case Side.Front:  return Color.Green
                     case Side.Right:  return Color.Red
                     case Side.Back:   return Color.Blue
                     case Side.Left:   return Color.Orange
                     case Side.Down: return Color.Yellow
                     }
        }
    }
}
