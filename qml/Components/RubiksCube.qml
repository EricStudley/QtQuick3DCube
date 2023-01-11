import QtQuick
import QtQuick3D

Node {

    property int cellSize: 1

//    HelperOverlay { }

    Repeater3D {
        model: cubeModel

        CubeCell {
            matrix: role_matrix
            model: role_sideList
        }
    }
}
