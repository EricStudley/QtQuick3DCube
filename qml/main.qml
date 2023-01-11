import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

import "Components"

import Cube 1.0

Window {
    id: window
    width: 1280
    height: 720
    visible: true

    Shortcuts { }

    View3D {
        id: view
        anchors.fill: parent

        //! [environment]
        environment: SceneEnvironment {
            clearColor: "skyblue"
            backgroundMode: SceneEnvironment.Color
        }

        OrbitCameraController {
            anchors.fill: parent
            origin: rubiksCube
            camera: perspectiveCamera
        }

        //! [environment]

        //! [camera]
        PerspectiveCamera {
            id: perspectiveCamera
            position: Qt.vector3d(0, 0, 1000)
        }
        //! [camera]

        //! [light]
        DirectionalLight {
            eulerRotation.x: 180
            position: perspectiveCamera.position
        }

        //! [light]

        //! [objects]

        //        RubiksCube {
        //        }

        importScene: RubiksCube {
            id: rubiksCube
        }


        //        importScene: CubeFace {
        //            id: rubiksCube
        //            position: Qt.vector3d(100, 0, 0)
        //            scale: Qt.vector3d(1, 1, 0.01)
        //            source: "#Cube"
        //            color: Color.Green
        //            materials: [ DefaultMaterial {
        //                    diffuseColor: "blue"
        //                }
        //            ]
        //        }

        //! [objects]
    }
}
