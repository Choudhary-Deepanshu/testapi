import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testapi/Screens/auth_screen/sign_in_screen.dart';
import 'package:testapi/Screens/other_auth_screen/frame_info.dart';
import 'package:testapi/const/userids.dart';
import 'package:testapi/data/api/api_value.dart';
import 'package:testapi/screen/forgot_password.dart';
import 'package:testapi/utils/bottom_message.dart';
import 'package:testapi/utils/custom_Textfilled.dart';
import 'package:testapi/utils/helper_text.dart';
import 'package:testapi/utils/social_button.dart';

import '../../const/colors.dart';
import '../../utils/custom_button.dart';
import 'forgot_password_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController conPassCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  HelperText(
                    text: "Wellcome!",
                    isfontWeightBold: true,
                    fontsize: 28,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInIcons(FontAwesomeIcons.google, Colors.red, () {},
                          isPng: true),
                      SizedBox(width: 25),
                      SignInIcons(FontAwesomeIcons.apple, Colors.black, () {}),
                      SizedBox(width: 25),
                      SignInIcons(
                          FontAwesomeIcons.facebook, Colors.blue, () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: HelperText(
                      text: "or signup with",
                      fontsize: 12,
                      textColor: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    isRequired: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),
                    controller: nameCtrl,
                    keyboardType: TextInputType.name,
                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Full Name",
                    prefix: Icon(Icons.person_2_outlined),

                    // prefix: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: HelperText(
                    //     text: '@', isfontWeightBold: true, textColor: Colors.black,
                    //     //               ),
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    isRequired: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),
                    controller: emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Email Address",
                    prefix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HelperText(
                        text: '@',
                        textColor: Colors.black,
                        //               ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    isRequired: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),
                    controller: numberCtrl,
                    keyboardType: TextInputType.number,
                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Phone Number",
                    prefix: Icon(Icons.call),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    isRequired: true,
                    isPass: true,
                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),

                    controller: passCtrl,
                    keyboardType: TextInputType.emailAddress,

                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Password",

                    prefix: Icon(Icons.lock_outline),

                    //               ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    isRequired: true,

                    textStyle: TextStyle(color: primary),
                    cursorHeight: 30,
                    textFilledHeight: 90,
                    fillColor: Color.fromARGB(196, 237, 236, 236),

                    controller: conPassCtrl,
                    keyboardType: TextInputType.visiblePassword,

                    isborderSide: false,
                    isPrefix: true,
                    hintText: "Re-enter Password",

                    prefix: Icon(Icons.lock_outline),

                    //               ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                          child: HelperText(
                            text: "Login",
                            isUnderline: true,
                            fontsize: 15,
                          )),
                      SizedBox(
                        width: 220,
                        height: 50,
                        child: CustomButton(
                            borderRadius: 30,
                            backgroundColor: primary,
                            text: "Continue",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (passCtrl.text.trim() ==
                                    conPassCtrl.text.trim()) {
                                  addAllDataInMap();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => FarmInfo())));
                                }
                                else{
                                  scaffoldMessage(context: context, message: "Password don't match");
                                }
                              }
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addAllDataInMap() {
    signUpMap = {
      "full_name": nameCtrl.text.trim(),
      "email": emailCtrl.text.trim(),
      "phone": "+91${numberCtrl.text.trim()}",
      "password": passCtrl.text.trim(),
      "role": role,
    };
  }
}

Map<String, dynamic> signUpMap = {};
