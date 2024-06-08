

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:general_knowlodge/app_colors.dart';
import 'package:general_knowlodge/helper.dart';

class QuestionPage extends StatefulWidget{

  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  
  late int questionNumber = 1;
  late String question = "Istanbulu Kim Fethetti?";
  late List<String> choices = [

    "Yıldırım Beyazid",
    "Fatih Sultan Mehmed",
    "Kanuni Sultan Süleyman",
    "2. Abdulhamid"

  ];

  late bool isChoiceEnabled = false;

  @override
  Widget build(BuildContext context){

    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return Scaffold(

      backgroundColor: AppColors.loginStartColor,

      appBar: AppBar(

        title: Text("Soru ${questionNumber.toString()}"),
        backgroundColor: AppColors.loginStartColor,

      ),

      body: Padding(
        padding:  const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 64.0),
        child: SizedBox(
        
          width: double.infinity,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: const TextStyle(
                  fontSize: 32
                ),
              ),

              const SizedBox(height: 10,),

              Column(
                children: [
                  for(String choice in choices) 
                    choiceButtonWidget(choice),
                ],
              ),

              SizedBox(height: height / 20,),
              
              Spacer(),

              Center(
                child: SizedBox(

                  width: double.infinity,
                  height: height / 10,
                  
                  child: ElevatedButton(
                    onPressed: () {

                      setState(() {
                        isChoiceEnabled = true;
                      });

                    }, 

                    style: ElevatedButton.styleFrom(

                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(Helper.CHOICE_BORDER_RADIUS)

                      )
                    ),

                    child: const Text("BAS", 
                      style: TextStyle(

                        fontSize: 42,
                        fontWeight: FontWeight.bold

                      ),
                    )
                  ),
                ),
              )

              
            ],
          ),
        ),
      ),

    );

  }

  Widget choiceButtonWidget(String choice) {
    return Column(
      children: [
        ElevatedButton( 
                        onPressed: isChoiceEnabled ? () => print("Pressed ${choice}") : null,
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: AppColors.choiceBackgroundDisenabled,
                          backgroundColor: AppColors.choiceBackgroundEnabled  ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Helper.CHOICE_BORDER_RADIUS)
                          )
                        ), 
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            
                            choice,textAlign: 
                            TextAlign.left,
                            style: TextStyle(

                              color: Colors.black

                            ), 
                          )
                        ),

                      ),
        const SizedBox(height: 10,)
      ],
    );
  }
}