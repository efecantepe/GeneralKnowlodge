// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:general_knowlodge/app_colors.dart';

class HomePage extends StatelessWidget{

  const HomePage({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      
      backgroundColor: AppColors.backgroundColor,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextButton(
              onPressed: () => Navigator.pushNamed(context, "/createRoom"), 
              child: Text("Create Room")
            ),

            TextButton(
              onPressed: () => Navigator.pushNamed(context, "/joinRoom"),
              child: Text("Join Room"),
            )

          ],

        ),

      ),

    );

  }


}