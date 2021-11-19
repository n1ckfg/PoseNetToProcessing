/*
https://florianschulz.info/stt/
Simple WebSocketServer example that can receive voice transcripts from Chrome
Requires WebSockets Library: https://github.com/alexandrainst/processing_websttSockets
*/

import websockets.*;

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
  println(msg);
}
