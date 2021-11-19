/*
https://florianschulz.info/stt/
Simple WebSocketServer example that can receive voice transcripts from Chrome
Requires WebSockets Library: https://github.com/alexandrainst/processing_websttSockets
*/

import websockets.*;

PVector[] points;

WebsocketServer poseNetSocket;
String poseNetMessage = "";

void setupPoseNetReceiver() {
  poseNetSocket = new WebsocketServer(this, 1337, "/p5websocket");
}

void setupPoseNetReceiver(int _port, String _channel) {
  poseNetSocket = new WebsocketServer(this, _port, _channel);
}

void webSocketServerEvent(String msg) {
  poseNetMessage = msg;
  
  String[] pointString = msg.split(" ");
  if (pointString.length %2 == 0) {
    points = new PVector[int(pointString.length/2)];
    for (int i=0; i<pointString.length; i+= 2) {
      points[int(i/2)] = new PVector(float(pointString[i]), float(pointString[i+1]));
    }  
    println(points);
  }
}
