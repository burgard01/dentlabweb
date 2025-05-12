//
// File: dentlabweb_theme_constants.dart
//
// Purpose: DenbtLabWeb own app UI theme constants.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
//

import 'package:flutter/material.dart';

/// Class: DentUIConstants
///
/// Purpose: Declaration of all DenbtLabWeb app UI constants.
///
class DentUIThemeConstants {
  ///
  /// Class named constructor to make the class non-instantiable.
  ///
  DentUIThemeConstants._();

  ///-----------------------------------------------------
  /// Color static light theme primary colors declarations
  ///-----------------------------------------------------
  ///

  ///-----------------------------------------------------
  /// UI primary & secondary UI colors
  ///-----------------------------------------------------
  static const Color dentColorLightGray = Color(0xFFCCCCCC);
  static const Color dentColorOrange = Color(0xFFf9AC5A);
  static const Color dentColorRed = Color(0xFFED5666);
  static const Color dentColorGreen = Color(0xFF1AB394);
  static const Color dentColorBlue = Color(0xFF1D84C6);
  static const Color dentColorBlack = Color(0xFF263949);
  
  ///-----------------------------------------------------
  /// Text colors
  ///-----------------------------------------------------
  static const Color dentLightTextColor = Color(0xFFFFFFFF);
  static const Color dentDarkTextColor = Color(0xFF263949);

  ///-----------------------------------------------------
  /// Font sizes
  ///-----------------------------------------------------
  static const double fontSize10 = 10;
  static const double fontSize11 = 11;
  static const double fontSize12 = 12;  
  static const double fontSize16 = 16;
  static const double fontSize20 = 20;
  static const double fontSize30 = 30;
  static const double fontSize40 = 40;

  //----------
  // UI values
  //----------
  static const double dentAppBarTitleFontsize = 18;
  static const String dentFontFamily = "Rubik";
}
