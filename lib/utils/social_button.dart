import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

SignInIcons(IconData iconName, Color? iconColor, VoidCallback onPressed,
      {bool isPng = false}) {
    return Container(
      height: 45,
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: isPng
            ? InkWell(
              onTap: onPressed,
              child: Image(
                  image: AssetImage("assets/images/Icon.png"),
                  height: 30,
                  width: 30,
                ),
            )
            : IconButton(
                onPressed: onPressed,
                icon: FaIcon(
                  iconName,
                  // FontAwesomeIcons.google,
                  size: 30,
                  color: iconColor,
                ),
              ),
      ),
    );
  }