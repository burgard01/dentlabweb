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
  final String benutzername;
  final String passwort;

  // TODO - Add more fields as needed ...

  ///
  /// Constructor for the UserModel class.
  ///
  /// [benutzername] is the username of the user.
  /// [passwort] is the password of the user.
  ///
  UserModel({required this.benutzername, required this.passwort});

  ///
  /// Factory constructor to create a UserModel instance from a JSON object.
  ///
  /// [json] is the JSON object containing the user data.
  /// Returns a UserModel instance.
  ///
  UserModel.fromJson(Map<String, dynamic> json)
    : benutzername = json['benutzername'] as String,
      passwort = json['passwort'] as String;

  ///
  /// Converts the UserModel instance to a JSON object.
  ///
  Map<String, dynamic> toJson() => {
    'benutzername': benutzername,
    'passwort': passwort,
  };
}
