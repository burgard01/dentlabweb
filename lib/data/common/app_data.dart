//
//  File: app_data.dart
//
// Purpose: DentLabWeb app wide data.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 14.05.2025
//

///
/// Class: AppData
///
/// Purpose: Singleton class. Holds all app wide user data.
///
class AppData {
  String sessionID = "";
  String username = "";
  String userID = "";
  String firstName = "";
  String lastName = "";
  String companyName = "";
  String email = "";
  
  static final AppData _instance = AppData._internal();

  ///
  /// Factory constructor to return the singleton instance. 
  ///
  factory AppData() {
    return _instance;
  }

  ///
  /// Private constructor to prevent instantiation 
  /// from outside the class.
  ///
  AppData._internal();
}
