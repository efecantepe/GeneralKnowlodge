import 'dart:io';
import 'dart:typed_data';

import 'package:general_knowlodge/client.dart';

class Server {

  
  late InternetAddress ip;
  late ServerSocket serverSocket;
  late List<Socket> clientList;

  Server._create(){
    print("Server initialization starts");
  }

  startListening(){
    serverSocket.listen((event) {
      handleConnection(event);  
    });
  }

  handleConnection(Socket client){

                                                                            
                                                                            





                                                                            
  }


  addClient(Socket client){
    clientList.add(client);
  }


  static Future<Server> create() async{
    Server server = Server._create();
    server.clientList = [];
    server.ip = InternetAddress.anyIPv4;
    server.serverSocket = await ServerSocket.bind(server.ip, 3000);
    server.startListening();
    
    return server;
  }




  
}