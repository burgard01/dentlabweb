//
//  File: ljumbo_cubit.dart
//
// Purpose: DentLabWeb jumbo Cubit controller.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 21.05.2025
// Modified: 21.05.2025
//

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:dentlabweb/data/repositories/jumbo_repo.dart';
import 'package:dentlabweb/cubit/constants/cubit_string_constants.dart';

part 'jumbo_states.dart';

///
/// Class: JumboCubit
///
/// Purpose: Implements the JumboCubit class.
///
class JumboCubit extends Cubit<CubitJumboState> {
  final JumboRepo jumboRepo = JumboRepo();

  ///
  /// Class constructor.
  ///
  JumboCubit() : super(CubitJumbonInitial());

  ///
  /// Get jumbos from database table "tblJumbos".
  ///
  void getJumbos() async {
    emit(CubitJumboLoading(isLoading: true));
  }

  ///
  /// Import jumbo: store jumbo data in database
  /// table "tblJumbos" & "tblJumbopositionen".
  ///
  void importJumbo({
    required String jumboFileContent,
    required List<String> jumboFileAsList,
  }) async {
    emit(CubitJumboImport(jumboImportProccesing: true));

    //-------------------------------------
    // First parse the JSON file. Check the
    // syntax and if it is valid JSON
    //-------------------------------------
    if (_parseJSONFile(jumboFileContent: jumboFileContent)) {
      //---------------------------------------------------
      // DentLabWeb Server-API communication via repository
      //---------------------------------------------------
      String response = await jumboRepo.importJumbo(
        jumboFileContent: jumboFileContent,
        jumboFileAsList: jumboFileAsList,
      );

      if (response == CubitStringConstants.commError) {
        emit(CubitCommunicationError(isLoading: false));
      } else if (response == CubitStringConstants.serverInternalError) {
        emit(CubitInternalServerError(isLoading: false));
      } else {}

      if (response == 'success') {
        emit(CubitJumboImport(jumboImportProccesing: false));
        emit(CubitJumboImportError(importSuccess: true));
      } else {
        emit(CubitJumboImport(jumboImportProccesing: false));
        emit(CubitJumboImportError(importSuccess: false));
      }
    } else {
      emit(CubitJumboImportError(importSuccess: false));
    }
  }

  ///
  /// Parse JSON file: Check the syntax.
  ///
  bool _parseJSONFile({required String jumboFileContent}) {
    try {
      jsonDecode(jumboFileContent);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
