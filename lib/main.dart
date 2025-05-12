//
//  File: main.dart
//
// Purpose: DentLabWeb starting point.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
//

import 'package:flutter/material.dart';

import 'package:dentlabweb/presentation/dentlabweb_theme_constants.dart';
import 'package:dentlabweb/presentation/screens/login/login_page.dart';

///
/// DentLabWeb entry point.
///
void main() {
  runApp(const DentLabWebApp());
}

///
/// Class: LoginPage
///
/// Purpose: DentLabWeb main root class.
///
class DentLabWebApp extends StatelessWidget {
  const DentLabWebApp({super.key});

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: DentUIThemeConstants.dentColorGreen,
        ),
      ),
      home: const LoginPage(), // Show DentLabWeb login page
    );
  }
}
