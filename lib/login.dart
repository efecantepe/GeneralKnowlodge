// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:general_knowlodge/app_colors.dart';

class LoginPage extends StatelessWidget{

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(

      backgroundColor: AppColors.backgroundColor,
      body: Container(
        child: Center(
          child: Text("Start")
        )
      )

    );  

  }
  

}