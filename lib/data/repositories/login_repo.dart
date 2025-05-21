//
//  File: login_repo.dart
//
// Purpose: DentLabWeb login repository.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 14.05.2025
// Modified: 14.05.2025
//

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'package:dentlabweb/cubit/constants/cubit_string_constants.dart';
import 'package:dentlabweb/data/repositories/dentlabweb_repo_constants.dart';

///
/// Class: LoginRepo
///
/// Purpose: Implements the DentLabWeb LoginRepo class.
///
class LoginRepo {   
  //final String _serverApiUrl = DentRepoConstants.serverApiUrl + DentRepoConstants.loginRestApiNode;
  final String _serverApiUrl = DentRepoConstants.serverApiUrl + DentRepoConstants.loginRestApiPHP;

  ///
  /// Login handling function (auth is true or not).
  /// Get user data with given username and password.
  ///
  /// Returns the body string
  ///
  Future<String> login(String username, String password) async {
    //-------------------------------
    // Hash password to SHA256 digest
    //-------------------------------
    var bytes1 = utf8.encode(password);
    var passwdHash = sha256.convert(bytes1).toString();

    try {
      final response = await http.post(
        Uri.parse(_serverApiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'action': DentRepoConstants.actionLogin,
          'username': username,
          'password': passwdHash,
        }),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return CubitStringConstants.serverIntarnalError;
      }
    } on Exception {
      return CubitStringConstants.commError;
    }
  }
}
