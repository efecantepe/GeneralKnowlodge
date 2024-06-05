// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:general_knowlodge/app_colors.dart';
import 'package:general_knowlodge/helper.dart';

class LoginPage extends StatelessWidget{

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){

    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(

      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Container(
      
            width: currentWidth * Helper.getWidth(274),
            height: currentHeight * Helper.getHeight(125),
            decoration: BoxDecoration(
              
              color: AppColors.loginStartColor, 
              borderRadius: BorderRadius.circular(62)
            ),
            
            child: Center(
              
              child: TextButton(

                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.loginStartColor)

                ),

                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, "/joinPage", (route) => false) ,
                child: Text(
                  "Start",
                  style: TextStyle(
                    
                    color: Colors.black,
                    fontSize: 48,
                    fontStyle: FontStyle.italic

                  ),
                )
              )
            )
        )
      )

    );  

  }
  

}