//
// File: home_page.dart
//
// Purpose: DentLabWeb Home (Start) page.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 19.05.2025
//

import 'package:dentlabweb/presentation/common_widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dentlabweb/presentation/dentlabweb_theme_constants.dart';
import 'package:dentlabweb/presentation/screens/login/login_page.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_string_constants.dart';

///
/// Class: HomePage
///
/// Purpose: DentLabWeb home (Start) page implementation.
///
class HomePage extends StatelessWidget {
  ///
  /// Class constructor.
  ///
  const HomePage({super.key});

  ///
  /// Button pressed event to go to login page.
  ///
  void btnPressedEvent(BuildContext context) {
    GoRouter.of(context).go('/login');   
  }

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    // Get the screen width of device
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DentUIThemeConstants.dentColorGreen,
        title: Text(
          DentUIStringConstants.homePageAppbarText,
          style: const TextStyle(
            color: DentUIThemeConstants.dentLightTextColor,
            fontFamily: DentUIThemeConstants.dentFontFamily,
            fontSize: DentUIThemeConstants.dentAppBarTitleFontsize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding:
            screenWidth < 1280
                ? const EdgeInsets.symmetric(horizontal: 40)
                : const EdgeInsets.symmetric(horizontal: 450),
        children: [
          SizedBox(height: 50,),
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
                btnPressedEvent,
                DentUIThemeConstants.dentColorGreen,
                DentUIThemeConstants.dentLightTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
