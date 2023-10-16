import QtQuick 2.15
import QtQuick.Window 2.15
import QtLocation       5.3
import QtPositioning    5.3
Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Plugin {
        id: mapPlugin
        name: "osm" // "mapboxgl", "esri", ...
        // specify plugin parameters if necessary
        // PluginParameter {
        //     name:
        //     value:
        // }
    }
    function path(){
        var rect = Qt.rect(mapControl.x + 50, mapControl.y+50, mapControl.width* 0.5, mapControl.height* 0.5)
        rect.x += (rect.width * 0.25) / 2
        rect.y += (rect.height * 0.25) / 2
        rect.width *= 0.75
        rect.height *= 0.75
        var centerCoord =       mapControl.toCoordinate(Qt.point(rect.x + (rect.width / 2), rect.y + (rect.height / 2)),   false /* clipToViewPort */)
        var topLeftCoord =      mapControl.toCoordinate(Qt.point(rect.x, rect.y),                                          false /* clipToViewPort */)
        var topRightCoord =     mapControl.toCoordinate(Qt.point(rect.x + rect.width, rect.y),                             false /* clipToViewPort */)
        var bottomLeftCoord =   mapControl.toCoordinate(Qt.point(rect.x, rect.y + rect.height),                            false /* clipToViewPort */)
        var bottomRightCoord =  mapControl.toCoordinate(Qt.point(rect.x + rect.width, rect.y + rect.height),              false /* clipToViewPort */)
        return [ topLeftCoord, topRightCoord, bottomRightCoord, bottomLeftCoord  ]

    }
    property var cTX;

    function setShape(ctx){
        ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas

        // Calculate the canvas shape coordinates based on the map zoom level
        var centerX = canvas.width / 2;
        var centerY = canvas.height / 2;
        var radius = 200 / mapControl.zoomLevel; // Adjust the size based on zoom level

        ctx.beginPath();
        ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
        ctx.fillStyle = "transparent"; // Set the fill color
        ctx.fill();
        ctx.strokeStyle = "black"; // Set the stroke color
        ctx.lineWidth = 2; // Set the border width
        ctx.stroke();
    }


    Timer {
        interval: canvas.interval
        running: true
        repeat: true
        onTriggered: canvas.requestPaint()
    }
    Map {
        id: mapControl
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(17.434188871225786, 78.38235779901032) // Oslo
        zoomLevel: 14
        onZoomLevelChanged: {
            console.log("zoom level ",zoomLevel)

//            setShape(cTX)
        }

        Rectangle {
            width: 30 // Width of the canvas shape
            height: 30 // Height of the canvas shape
            color: "transparent" // Make the rectangle transparent

            // Calculate the position of the rectangle based on map coordinates
            x: (mapControl.width - width) / 2 // Center horizontally
            y: (mapControl.height - height) / 2 // Center vertically

            Canvas {
                id: canvas
                width: parent.width
                height: parent.height

                onPaint: {

                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas

                    // Calculate the canvas shape coordinates based on the map zoom level
                    var centerX = canvas.width / 2;
                    var centerY = canvas.height / 2;
                    var radius = 200 / mapControl.zoomLevel; // Adjust the size based on zoom level

                    ctx.beginPath();
                    ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
                    ctx.fillStyle = "transparent"; // Set the fill color
                    ctx.fill();
                    ctx.strokeStyle = "black"; // Set the stroke color
                    ctx.lineWidth = 2; // Set the border width
                    ctx.stroke();
                }
            }
        }
    }
}


//        MapPolyline {
//            id:mapPolyline
//            line.color: "blue" // Set the color of the curve
//            line.width: 2 // Set the line width
//            path:  window.path()
////            path: [
////                // Define the start point (latitude, longitude)
////                QtPositioning.coordinate(17.44633208745913, 78.38334032149156),

////                // Approximate the Bezier curve with intermediate points
////                QtPositioning.coordinate(17.446435369256733, 78.3833583651707),
////                QtPositioning.coordinate(17.446280446538385, 78.38878951258924),
////                QtPositioning.coordinate(17.44435250836423, 78.38563186874124), // 100 points for the approximation

////                // Define the end point (latitude, longitude)
////                QtPositioning.coordinate(17.443319675956673, 78.3876708044831)
////            ]
//        }
//    }
//    Component.onCompleted: {
//        mapPolyline.path=
//    }

//    Canvas {
//        id: canvas
//        anchors.fill: parent

//        onPaint: {
////            var ctx = getContext("2d");
////            ctx.beginPath()
//////            ctx.fillStyle = grad
////            ctx.moveTo(100, 100)
////            ctx.lineTo(150, 150)
////            ctx.bezierCurveTo(
////                        151, 151,
////                       160,160,
////                       170,170)
////            ctx.lineTo(180, 180)
////            ctx.bezierCurveTo(181, 181,
////                              150, 160,
////              /*                60,130
////                        )
////            ctx.fillStyle = "transparent";
////            ctx.fill()
////            ctx.strokeStyle = "black"; // Set the stroke color (border color)
////            ctx.lineWidth = 2; // Set the border width
////            ctx.stroke();
//            //                 var ctx = getContext("2d");
//            //                       ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas

//            //                       var centerX = canvas.width / 2;
//            //                       var centerY = canvas.height / 2;
//            //                       var radius = 100;

//            //                       ctx.beginPath();
//            //                       ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
//            //                       ctx.fillStyle = "transparent"; // Set the fill color
//            //                       ctx.fill(); // Fill the circle with the specified color
//            //                       ctx.strokeStyle = "black"; // Set the stroke color (border color)
//            //                       ctx.lineWidth = 2; // Set the border width
//            //                       ctx.stroke(); // Draw the circle border

//            var ctx = getContext("2d");
//            ctx.clearRect(*/0, 0, canvas.width, canvas.height); // Clear the canvas

//            ctx.beginPath();
//            ctx.moveTo(50, 50); // Starting point (x1, y1)
//            ctx.bezierCurveTo(100, 25, 200, 100, 200, 25); // Control points (x2, y2, x3, y3), Ending point (x4, y4)
//            ctx.lineWidth = 2;
//            ctx.strokeStyle = "blue";
//            ctx.stroke();
//    }
//    }


//}
