//
// File: dentlabweb_repo_constants.dart
//
// Purpose: DenbtLabWeb repository constants.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
// Modified: 12.05.2025
//

/// Class: DentRepoConstants
///
/// Purpose: Declaration of all DenbtLabWeb repository constants.
///
class DentRepoConstants {
  ///
  /// Class named constructor to make the class non-instantiable.
  ///
  DentRepoConstants._();

  //--------------------------
  // DentLabWeb Server API URL
  //--------------------------
  static const String serverApiUrl = "http://localhost:4003";

  //-------------------
  // Login API PHP-File
  //-------------------
  static const String loginRestApiNode = "/login";
  static const String loginRestApiPHP = "/loginHandler.php";

  //--------
  // Actions
  //--------
  static const String actionLogin = "login";
  static const String actionJumboImport = "jumboImport";
}
