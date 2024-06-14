import 'dart:io';

Future<void> main() async{

  final socket = await Socket.connect("127.0.0.1", 3000);
  print("Client is connected");


  socket.listen((event) { 

    final serverResponse = String.fromCharCodes(event);
    print("Client $serverResponse");

  },
  
  onDone: (){
    print("Client: Server left.");
    socket.destroy();
  },

  onError: (error){
    print(error);
  }

   
  
  );


}