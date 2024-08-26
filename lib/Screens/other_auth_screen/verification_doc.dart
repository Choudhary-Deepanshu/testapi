import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testapi/Screens/other_auth_screen/business_hours_screen.dart';
import 'package:testapi/screen/forgot_password.dart';
import 'package:testapi/utils/bottom_message.dart';
import 'package:testapi/utils/custom_Textfilled.dart';
import 'package:testapi/utils/file_picker.dart';
import 'package:testapi/utils/helper_text.dart';
import 'package:testapi/utils/social_button.dart';

import '../../const/colors.dart';
import '../../utils/custom_button.dart';
import '../auth_screen/sign_up_screen.dart';

class VerificationDocs extends StatefulWidget {
  const VerificationDocs({super.key});

  @override
  State<VerificationDocs> createState() => _VerificationDocsState();
}

class _VerificationDocsState extends State<VerificationDocs> {
  TextEditingController businessNameCtrl = TextEditingController();
  String pickdocName = "";

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              HelperText(
                text: "Verification",
                isfontWeightBold: true,
                fontsize: 28,
              ),
              const SizedBox(
                height: 25,
              ),
              HelperText(
                text:
                    "Attached proof of Department of Agriculture registrations i.e Florida Fresh, USDA Approved, USDA Organic",
                fontsize: 12,
                textColor: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HelperText(
                    text: "Attach proof of registration",
                    fontsize: 16,
                  ),
                  InkWell(
                    onTap: () async {
                      pickdocName = await pickImage();

                      setState(() {});
                    },
                    child: CircleAvatar(
                      backgroundColor: primary,
                      radius: 30,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              pickdocName.isEmpty
                  ? SizedBox()
                  : Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color.fromARGB(196, 237, 236, 236)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              pickdocName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                fontFamily: "vietnam",
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                pickdocName = "";
                                setState(() {});
                              },
                              icon: Icon(Icons.close))
                        ],
                      )),
              Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: CustomButton(
                        borderRadius: 30,
                        backgroundColor: primary,
                        text: "Continue",
                        onPressed: () {
                          if (pickdocName.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BusinessHours()));
                          }
                          else{
                            scaffoldMessage(context: context, message: "Please Attach proff of registrations");
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  addAllDataInMap() {
    signUpMap = {
      "registration_proof": pickdocName,
    };
  }
}
