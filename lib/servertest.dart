import 'dart:io';
import 'dart:typed_data';

Future<void> main() async{

  // TODO Server.1: get a free IP address
  final ip = InternetAddress.anyIPv4;
  final server = await ServerSocket.bind(ip, 3000);
  print("Server is running on ${ip.address}:3000");

  server.listen((event) { 

    handleConnection(event);

  });


  print("Efe");


}


List<Socket> clients = [];



handleConnection(Socket client){

  client.listen(

    (Uint8List data){
      final message = String.fromCharCodes(data);

      for(final c in clients){
        c.write("Server $message joined the party");
      }

      clients.add(client);
      client.write("Server: you are logged in as $message");
    },

    onError: (error) {
      print("Error");
      client.close();
    },

    onDone: () {
      print("Server: Client left");
      client.close();
    }

  );

}