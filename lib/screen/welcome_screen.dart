

import 'package:flutter/material.dart';
import 'package:testapi/screen/form_info_screen.dart';

    Map<String,dynamic> apiData={};
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController conPassCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();

  GlobalKey<FormState> _formKey=  GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( 
        title: const Text("welcome screen"),
      ),
      body: Form(
        key:_formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column( 
        mainAxisSize: MainAxisSize.min,
            children: [ 
              TextFormField(
                decoration: const InputDecoration(
                  hintText:"Enter your name",
                ), 
                controller: nameCtrl,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Filled are required";
                  }
                  else{
                    return null;
                  }

                },
              ),
               TextFormField(
                decoration: const  InputDecoration(
              hintText: "Enter your email",
                ), 
                controller: emailCtrl,
                    validator: (value){
                  if(value==null || value.isEmpty){
                    return "Filled are required";
                  }
                  else{
                    return null;
                  }

                },
              ), TextFormField(
                decoration:const InputDecoration(
                  hintText:"Enter your number"
                ), 
                controller: numberCtrl,
                    validator: (value){
                  if(value==null || value.isEmpty){
                    return "Filled are required";
                  }
                  else{
                    return null;
                  }

                },
              ), TextFormField(
                decoration: const InputDecoration(
                  hintText:"Enter your password"
                ), 
                controller: passCtrl,
                    validator: (value){
                  if(value==null || value.isEmpty){
                    return "Filled are required";
                  }
                  else{
                    return null;
                  }

                },
              ), TextFormField(
                decoration:const InputDecoration(
                  hintText:"Enter Confirm password"
                ), 
                controller: conPassCtrl,
                validator: (value){
                  if(passCtrl.text!=value){
                    return "Password  don't match";
                  }
                  else{
                    return null;
                  
                  }
                },
              ),
              
              ElevatedButton(
                onPressed: (){
                if(_formKey.currentState!.validate()){
                  addAllDataInMap();

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const FormScreen()));
                }
              }, child:const Text("next")),
          
            ],
          ),
        ),
      )
    );
  }
  addAllDataInMap(){
    apiData={
      "full_name": nameCtrl.text.trim(),
  "email": emailCtrl.text.trim(),
  "phone": numberCtrl.text.trim(),
  "password": passCtrl.text.trim(),
  "role": "farmer",
    };
  }
}