/*
https://florianschulz.info/stt/
Simple WebSocketServer example that can receive voice transcripts from Chrome
Requires WebSockets Library: https://github.com/alexandrainst/processing_websttSockets
*/

import websockets.*;

PVector[] keyPoints, skelPoints;

WebsocketServer poseNetSocket;
String poseNetMessage = "";

void setupPoseNetReceiver() {
  init(1337, "/p5websocket");
}

void setupPoseNetReceiver(int _port, String _channel) {
  init(_port, _channel);
}

void init(int _port, String _channel) {
  poseNetSocket = new WebsocketServer(this, _port, _channel);
  keyPoints = new PVector[0];
  skelPoints = new PVector[0];
}

void webSocketServerEvent(String msg) {
  poseNetMessage = msg;
  
  String[] pointString = msg.split(" ");
  
  if ((pointString.length-1) %2 == 0) {
    println(pointString);
    
    PVector[] newPoints = new PVector[int(pointString.length/2)];
    for (int i=1; i<pointString.length; i+= 2) {
      newPoints[int(i/2)] = new PVector(float(pointString[i]), float(pointString[i+1]));
    }  
    if (pointString[0].equals("k")) {
      keyPoints = newPoints;
    } else if (pointString[0].equals("s")) {
      skelPoints = newPoints;
    }
  }
  
}
