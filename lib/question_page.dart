// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:general_knowlodge/app_colors.dart';
import 'package:general_knowlodge/helper.dart';


Stream<String> periodicQuestionStream(String input, Duration period) async*{
  for(int i = 0; i < input.length; i++){
    yield input[i];
    await Future.delayed(period);
  }
}

List<Map<String, dynamic>> questions = [

  {

    "question" : "Istanbulu Kim Fethetti?",
    "choices" : <String> [

      "Yıldırım Beyazid",
      "Fatih Sultan Mehmed",
      "Kanuni Sultan Süleyman",
      "2. Abdulhamid"

    ]
  },

  {

    "question" : "Türkiye Cumhuriyetini Kim Kurdu?",

     "choices" : <String> [

      "Bülent Ecevit",
      "Efe Can Tepe",
      "Mustafa Kemal Atatürk",
      "Celal Bayar"

    ],
  },

  {
    "question" : "Hangisi Bir Avrupa Devleti Değildir?",

     "choices" : <String> [
      "Fransa",
      "Almanya",
      "İspanya",
      "Fas"
    ],
  },

];

class QuestionPage extends StatefulWidget{

  
  QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  final Stream<String> questionStream = periodicQuestionStream(questions[0]["question"], Duration(milliseconds: 50));
  late StreamSubscription<String> questionSubscription;
  String question = "";


  @override
  void initState(){

    super.initState();
    questionSubscription = questionStream.listen((char) { 
      setState(() {
        question += char;
      });
    });

  }

  
  int currentQuestionIndex = 0;

  late bool isChoiceEnabled = false;

  @override
  Widget build(BuildContext context){

    int questionNumber = currentQuestionIndex + 1;
    //String question = questions[currentQuestionIndex]["question"]!;
    List<String> choices = questions[currentQuestionIndex]["choices"] as List<String>;

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
                    choiceButtonWidget(""),
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

                      if(!questionSubscription.isPaused){
                        questionSubscription.pause();
                      }

                      else{
                        questionSubscription.resume();
                      }

                      setState(() {
                        isChoiceEnabled = !isChoiceEnabled;
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