import 'dart:convert';
import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart' as IO;

Future<void> main() async {
  // Dart client
  IO.Socket socket = IO.io('http://192.168.1.56:3000', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  socket.connect();
  int i = 0;
  await for (String name
      in stdin.transform(utf8.decoder).transform(const LineSplitter())) {
    if (name == 'add') {
      socket.emit('msg', 'A MESSAGE');
    }
  }
  socket.close();
}