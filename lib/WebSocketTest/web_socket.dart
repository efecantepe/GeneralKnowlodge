import 'dart:io';
import 'dart:convert';

void main() async {
  // Bind the server to any available network interface and port 4040

  InternetAddress ipv4 = InternetAddress.anyIPv4;

  print(ipv4.address);

  final server = await HttpServer.bind(InternetAddress.anyIPv4, 4040);
  print('WebSocket server is running on ws://${server.address.host}:${server.port}');

  // Listen for incoming HTTP requests
  await for (HttpRequest request in server) {
    // Upgrade HTTP requests to WebSocket connections
    if (request.uri.path == '/ws') {
      WebSocket socket = await WebSocketTransformer.upgrade(request);
      handleWebSocket(socket);
    } else {
      // Respond with 403 Forbidden if the path is not '/ws'
      request.response
        ..statusCode = HttpStatus.forbidden
        ..close();
    }
  }
}

void handleWebSocket(WebSocket socket) {
  print('Client connected: ${socket}');
  // Listen for messages from the client
  socket.listen((data) {
    print('Received data: $data');
    // Echo the received data back to the client
    socket.add('Echo: $data');
  }, onDone: () {
    // Handle client disconnection
    print('Client disconnected');
  });
}
