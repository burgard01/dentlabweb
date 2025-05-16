//
//  File: user.dart
//
//  Purpose: User entity model.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
//

///
/// Implemeentation of the UserModel class.
///
class UserModel {
  String? benutzername;
  String? passwort;

  // TODO - Add more fields as needed ...

  ///
  /// Class constructor.
  ///
  UserModel();

  ///
  /// Factory constructor to create a UserModel instance from a JSON object.
  ///
  /// [json] is the JSON object containing the user data.
  /// Returns a UserModel instance.
  ///
  UserModel.fromJson(Map<String, dynamic> json)
    : benutzername = json['Benutzername'] as String,
      passwort = json['Passwort'] as String;

  ///
  /// Converts the UserModel instance to a JSON object.
  ///
  Map<String, dynamic> toJson() => {
    'benutzername': benutzername,
    'passwort': passwort,
  };
}
