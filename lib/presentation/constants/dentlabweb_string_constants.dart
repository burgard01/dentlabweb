//
// File: dentlabweb_string_constants.dart
//
// Purpose: DenbtLabWeb own app UI string constants.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
//

/// Class: DentUIConstants
///
/// Purpose: Declaration of all DenbtLabWeb app UI constants.
///
class DentUIStringConstants {
  ///
  /// Class named constructor to make the class non-instantiable.
  ///
  DentUIStringConstants._();

  ///----------------------------
  /// Login page string constants
  ///----------------------------
  static const String loginPageHeaderline1Text = "DentLabWeb";
  static const String loginPageHeaderline2Text = "Benutzeranmeldung";
  static const String loginPageUsernameLabelText = "Benutzername *";
  static const String loginPagePasswordLabelText = "Passwort *";
  static const String loginPageButtonText = "Anmelden";
  static const String loginPageCopyrightText = "© 2025 Thomas Burgard Softwareentwicklung";
  
  // Login page error text
  static const String loginPageValidationUsernameErrorText = "Bitte Benutzername eingegeben!";
  static const String loginPageValidationPasswordErrorText = "Bitte Passwort eingegeben!";
  static const String loginPageErrorText = "Falsche Anmeldedaten! Bitte versuchen Sie es erneut.";
  
  ///----------------------
  /// Error string constant
  ///----------------------
  static const String internalServerErrorText = "Interner DenLabWeb-Server Fehler!";
  static const String commErrorText = "Kommunikationsfehler mit dem DenLabWeb-Server!";
}
