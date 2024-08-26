import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testapi/Screens/other_auth_screen/business_hours_screen.dart';
import 'package:testapi/screen/forgot_password.dart';
import 'package:testapi/utils/custom_Textfilled.dart';
import 'package:testapi/utils/helper_text.dart';
import 'package:testapi/utils/social_button.dart';

import '../../const/colors.dart';
import '../../utils/custom_button.dart';

class DoneScreen extends StatelessWidget {
  DoneScreen({super.key});

  TextEditingController businessNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(
                  height: 150,
                ),
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Image(image: AssetImage("assets/images/Vector.png"),fit: BoxFit.fitHeight,)),
                SizedBox(height: 20,),
               
                HelperText(
                  text: "You're all done!",fontsize: 28,
                 isfontWeightBold: true,
                ),
              SizedBox(height: 20,),
                HelperText(
                  align: TextAlign.center,
                  text:
                      "Hang tight! We are currently reviewing your account and will follw up with you in 2-3 business days. In the meantime, you can setup your inventory. ",
                  fontsize: 12,
                  textColor: Colors.grey.shade400,
                ),
                const SizedBox(
                  height: 35,
                ),
              
                Expanded(child: SizedBox()),
           
                    SizedBox(
                   width: double.infinity,
                      height: 50,
                      child: CustomButton(
                          borderRadius: 30,
                          backgroundColor: primary,
                          text: "Got it!",
                          onPressed: () {
                     
                          }),
                    ),
                  
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
