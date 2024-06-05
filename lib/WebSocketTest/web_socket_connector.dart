import 'dart:async';
import 'dart:io';

void main() async {
  // WebSocket server URL
  var url = 'ws://localhost:4040/ws';

  // Connect to the WebSocket server
  WebSocket socket = await WebSocket.connect(url);

  // Print the connection status
  print('Connected to: $url');

  // Send a message to the server
  String message = 'Hello WebSocket Server!';
  socket.add(message);

  // Listen for messages from the server
  socket.listen((message) {
    print('Received from server: $message');
  });

  // Wait for a few seconds and then close the connection
  await Future.delayed(Duration(seconds: 5));
  socket.close();

  print('WebSocket connection closed');
}
