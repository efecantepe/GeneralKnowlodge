// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:general_knowlodge/app_colors.dart';

List<String> categories = [
    "Genel Kültür",
    "League Of Legends"
];

class CreateRoomPage extends StatefulWidget{


  CreateRoomPage({super.key});

  @override
  State<CreateRoomPage> createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
 

  String selectedItem = categories[0];
  

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),

      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownMenu(
                

                onSelected: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                      
                label: Text("Kategoriler"),
                initialSelection: categories[0],
                dropdownMenuEntries: categories.map<DropdownMenuEntry>((String e) {
                return DropdownMenuEntry<String>(
                              value: e,
                              label: e,
                              style: MenuItemButton.styleFrom(
                                foregroundColor: Colors.black,
                              ));
                }).toList()
              ),
        
              SizedBox(height: 30,),
        
              TextField(

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Soru Sayısı',
                  hintText: 'Soru Sayısını girin',
                  prefixIcon: Icon(Icons.numbers),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),

              SizedBox(height: 30,),

              ElevatedButton(
                style: ButtonStyle(

                  backgroundColor: MaterialStatePropertyAll(AppColors.loginStartColor),
                  foregroundColor: MaterialStatePropertyAll(Colors.black)

                ),
                onPressed: () => print("Create Room"), 
                child: Text("Create Room")
              )
            ],
          
          ),
        ),
      )

    );

  }
}