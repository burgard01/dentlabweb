//
// File: login_page.dart
//
// Purpose: DentLabWeb Login page.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
//

import 'package:flutter/material.dart';

import 'package:dentlabweb/presentation/screens/login/login_form.dart';
import 'package:dentlabweb/presentation/dentlabweb_theme_constants.dart';

///
/// Class: LoginPage
///
/// Purpose: DentLabWeb user login implementation.
///
class LoginPage extends StatelessWidget {

  ///
  /// Class constructor.
  /// 
  const LoginPage({super.key});

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DentUIThemeConstants.dentColorGreen,
        title: Text(
          'DentLabWeb Benutzeranmeldung',
          style: const TextStyle(
            color: DentUIThemeConstants.dentLightTextColor,
            fontFamily: DentUIThemeConstants.dentFontFamily,
            fontSize: DentUIThemeConstants.dentAppBarTitleFontsize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: LoginForm(), // Show DentLabWeb login form
    );
  } 
}  
