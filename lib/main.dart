import 'dart:io';

import 'package:flutter/material.dart';
import 'package:testapi/Screens/auth_screen/sign_in_screen.dart';
import 'package:testapi/Screens/auth_screen/sign_up_screen.dart';
import 'package:testapi/Screens/on_boarding_screens/main_on_boarding_screen.dart';

import 'package:testapi/const/colors.dart';
import 'package:testapi/screen/business_hours_screen.dart';
import 'package:testapi/screen/forgot_password.dart';
import 'package:testapi/screen/welcome_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          primary: primary,
          secondary: secondary,
          tertiary: tertiary,
          seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:   const MainOnBoardingScreen(),
      home: MainOnBoardingScreen(),
    );
  }
}

