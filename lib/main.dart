// ignore_for_file: avoid_unnecessary_containers

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:general_knowlodge/create_room_page.dart';
import 'package:general_knowlodge/home_page.dart';
import 'package:general_knowlodge/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      
      title: "Create Server",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),

      initialRoute: "/homePage",

      routes: {
        "/login" : (context) => const LoginPage(),
        "/homePage" : (context) => const HomePage(),
        "/createRoom" : (context) => CreateRoomPage()
      },
    );
  }
}


// class ServerPage extends StatelessWidget{


//   createServer(){
//     print("Create Server");
//   }

//   joinGame(){
//     print("Join Game");
//   }


//   const ServerPage({super.key});

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () => createServer(), 
//                 child: Text("Create Server")
//               ),

//               SizedBox(height: 10,),  

//               ElevatedButton(
                
//                 onPressed: () => joinGame(), 
//                 child: Text("Join Game")
//               ),             

//             ],
//           ),
//         ),
//       ));
//   }

// }