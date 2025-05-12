//
// File: login_form.dart
//
// Purpose: DentLabWeb Login form widget.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
//

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:dentlabweb/presentation/dentlabweb_theme_constants.dart';
import 'package:dentlabweb/presentation/common_widgets/button_widget.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_string_constants.dart';

///
/// Class: LoginForm
///
/// Purpose: Implements the DentLabWeb app login form widget.
///
class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ///
  /// Class constructor.
  ///
  LoginForm({super.key});

  ///
  /// Send login button pressed event to sign in bloc.
  ///
  void sendBtnPressedEvent() {}

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    // Get the screen width of device
    double screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: ListView(
        padding:
            screenWidth < 1280
                ? const EdgeInsets.symmetric(horizontal: 40)
                : const EdgeInsets.symmetric(horizontal: 450),
        children: [
          //----------------------
          // 1. BurgarDental- Logo
          //----------------------
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 10),
            child: Center(
              child: SizedBox(
                width: 200,
                height: 115,
                child: Image.asset('assets/images/burgardental_logo_300.png'),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Center(
              child: Column(
                children: [
                  Text(
                    DentUIStringConstants.loginPageHeaderline1Text,
                    style: TextStyle(
                      fontSize: DentUIThemeConstants.fontSize40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    DentUIStringConstants.loginPageHeaderline2Text,
                    style: TextStyle(fontSize: DentUIThemeConstants.fontSize20),
                  ),
                ],
              ),
            ),
          ),

          //----------------------------------
          // 2. Entry fields username/password
          //----------------------------------
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLength: 50,
              obscureText: false,
              autofocus: false,
              style: const TextStyle(
                fontSize: DentUIThemeConstants.fontSize16,
                fontFamily: DentUIThemeConstants.dentFontFamily,
              ),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: Colors.white,
                floatingLabelStyle: const TextStyle(
                  fontSize: DentUIThemeConstants.fontSize16,
                ),
                prefixIcon: const Align(
                  widthFactor: 0.8,
                  heightFactor: 0.8,
                  child: Icon(
                    Icons.account_circle,
                    color: DentUIThemeConstants.dentColorGreen,
                  ),
                ),
                border: const OutlineInputBorder(),
                labelText: DentUIStringConstants.loginPageUsernameLabelText,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 5,
              bottom: 10,
            ),
            child: TextFormField(
              maxLength: 50,
              obscureText: true,
              autofocus: false,
              style: const TextStyle(
                fontSize: DentUIThemeConstants.fontSize16,
                fontFamily: DentUIThemeConstants.dentFontFamily,
              ),
              decoration: InputDecoration(
                counterText: '',
                floatingLabelStyle: const TextStyle(
                  fontSize: DentUIThemeConstants.fontSize16,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Align(
                  widthFactor: 0.8,
                  heightFactor: 0.8,
                  child: Icon(
                    Icons.password_rounded,
                    color: DentUIThemeConstants.dentColorGreen,
                    size: 25,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    MdiIcons.eyeOff,
                    color: DentUIThemeConstants.dentColorLightGray,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
                border: const OutlineInputBorder(),
                labelText: DentUIStringConstants.loginPagePasswordLabelText,
              ),
            ),
          ),

          //---------------------------------------------
          // 3. Show Loading indicator in case of pending
          //---------------------------------------------

          //----------------
          // 4. Login button
          //----------------
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 30,
              bottom: 30,
            ),
            child: Center(
              child: DentButton(
                DentUIStringConstants.loginPageButtonText,
                sendBtnPressedEvent,
                DentUIThemeConstants.dentColorGreen,
                DentUIThemeConstants.dentLightTextColor,
              ),
            ),
          ),

          //-------------------------
          // 5. Copyright information
          //-------------------------
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                DentUIStringConstants.loginPageCopyrightText,
                style: TextStyle(fontSize: DentUIThemeConstants.fontSize12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
