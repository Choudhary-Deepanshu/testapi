

import 'package:flutter/material.dart';
import 'package:testapi/screen/business_hours_screen.dart';
import 'package:testapi/screen/welcome_screen.dart';
Map<String,dynamic>apiFormData={};
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController businessNameCtrl = TextEditingController();
  TextEditingController informalNameCtrl = TextEditingController();
  TextEditingController streetAddCtrl = TextEditingController();
  TextEditingController cityAddCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController zipcodeCtrl = TextEditingController();


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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
              TextFormField(
                decoration: const InputDecoration(
                  hintText:"Enter your business name",
                ), 
                controller: businessNameCtrl,
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
              hintText: "Enter your informal Name",
                ), 
                controller: informalNameCtrl,
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
                  hintText:"Street Address"
                ), 
                controller: streetAddCtrl,
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
                decoration: const InputDecoration(
                  hintText:"City"
                ), 
                controller: cityAddCtrl,
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
                decoration: const InputDecoration(
                  hintText:"State"
                ), 
                controller: stateCtrl,
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
                decoration: const InputDecoration(
                  hintText:"zipcode"
                ), 
                controller: zipcodeCtrl,
                    validator: (value){
                  if(value==null || value.isEmpty){
                    return "Filled are required";
                  }
                  else{
                    return null;
                  }

                },
             
              
              ),
              
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  addAllDataInMap();
                
                  
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BusinessHoursScreen()));

                }
              }, child:const Text("next")),
          
            ],
          ),
        ),
      )
    );
  }
   addAllDataInMap(){
    apiFormData={
   "business_name": businessNameCtrl.text.trim(),
  "informal_name": informalNameCtrl.text.trim(),
  "address": streetAddCtrl.text.trim(),
  "city": cityAddCtrl.text.trim(),
  "state": stateCtrl.text.trim(),
  "zip_code": int.parse(zipcodeCtrl.text.trim()),
  "registration_proof": "my_proof.pdf",
    };
  }
}