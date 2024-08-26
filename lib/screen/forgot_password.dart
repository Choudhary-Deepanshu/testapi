import 'package:flutter/material.dart';
import 'package:testapi/data/api/api_value.dart';

class ForgotPassword extends StatelessWidget {
  ApiContainer apiContainer=ApiContainer();
   ForgotPassword({super.key});
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: Center(
      child: ElevatedButton(
       onPressed: ()async{
   
       var res= await apiContainer.forgotPassword(phone:  "+19876543210");
       print(res);
       },
      child:const Text("Send sms")),
    ),
    );
  }
}