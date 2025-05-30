//
//  File: junmbo_repo.dart
//
// Purpose: DentLabWeb jumbo repository.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 21.05.2025
// Modified: 21.05.2025
//


import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:dentlabweb/data/repositories/dentlabweb_repo_constants.dart';
import 'package:dentlabweb/cubit/constants/cubit_string_constants.dart';

///
/// Class: class JumboRepo {

///
/// Purpose: Implements the DentLabWeb class JumboRepo {
///
class JumboRepo {
  //final String _serverApiUrl = DentRepoConstants.serverApiUrl + DentRepoConstants.loginRestApiNode;
  final String _serverApiUrl =
      DentRepoConstants.serverApiUrl + DentRepoConstants.loginRestApiPHP;

  ///
  /// Import jumbo & jumbo positions ans store in
  /// database table "tblJumbo" & "tblJumbopositionen".
  ///
  /// Returns the response body string
  ///
  Future<String> importJumbo({
    required String jumboFileContent,
    required List<String> jumboFileAsList,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(DentRepoConstants.serverApiUrl + DentRepoConstants.loginRestApiPHP),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'action': DentRepoConstants.actionJumboImport,
          'jumbo': jumboFileContent,
        }),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return CubitStringConstants.serverInternalError;
      }
    
    } on Exception {
      return CubitStringConstants.commError;
    }
  }
}
