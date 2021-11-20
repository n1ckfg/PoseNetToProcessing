/*
https://florianschulz.info/stt/
Simple WebSocketServer example that can receive voice transcripts from Chrome
Requires WebSockets Library: https://github.com/alexandrainst/processing_websttSockets
*/

import websockets.*;

KeyPoint[] keyPoints, skelPoints, newPoints;

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
  keyPoints = new KeyPoint[0];
  skelPoints = new KeyPoint[0];
}

void webSocketServerEvent(String msg) {
  poseNetMessage = msg;
  
  String[] pointString = msg.split(" ");
  
  if ((pointString.length-1) %3 == 0) {
    println(pointString);
    
    newPoints = new KeyPoint[int(pointString.length/3)];
    for (int i=1; i<pointString.length; i+= 3) {
      newPoints[int(i/3)] = new KeyPoint(int(pointString[i]), float(pointString[i+1]), float(pointString[i+2]));
    }  
    if (pointString[0].equals("k")) {
      keyPoints = newPoints;
    } else if (pointString[0].equals("s")) {
      skelPoints = newPoints;
    }
  }
  
}
