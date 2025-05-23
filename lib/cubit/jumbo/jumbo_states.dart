//
//  File: jumbo_states.dart
//
// Purpose: DentLabWeb jumbo Cubit states.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 21.05.2025
// Modified: 1214.05.2025
//

part of 'jumbo_cubit.dart';

abstract class CubitJumboState {}

///
/// Class: CubitJumbonInitial
///
/// Purpose: CubitJumbonInitial class.
///
class CubitJumbonInitial extends CubitJumboState {}

///
/// Class: CubitJumboLoading
///
/// Purpose: CubitJumboLoading class.
///
class CubitJumboLoading extends CubitJumboState {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitJumboLoading({required this.isLoading});
}

///
/// Class: CubitJumboImportToggle
///
/// Purpose: CubitJumboShowImportArea class.
///
class CubitJumboShowImportArea extends CubitJumboState {
  final bool showJumboImportArea;

  ///
  /// Class constructor.
  ///
  CubitJumboShowImportArea({required this.showJumboImportArea});
}

///
/// Class: CubitJumboImport
///
/// Purpose: CubitJumboImport class.
///
class CubitJumboImport extends CubitJumboState {
  final bool jumboImportProccesing;

  ///
  /// Class constructor.
  ///
  CubitJumboImport({required this.jumboImportProccesing});
}

///
/// Class: CubitJumboImportError
///
/// Purpose: CubitJumboImportError class.
///
class CubitJumboImportError extends CubitJumboState {
  final bool importSuccess;

  ///
  /// Class constructor.
  ///
  CubitJumboImportError({required this.importSuccess});
}

//--- Error states ------------------------------------------------------------

///
/// Class: CubitInternalServerError
///
/// Purpose: CubitInternalServerError class.
///
class CubitInternalServerError extends CubitJumboState {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitInternalServerError({required this.isLoading});
}

///
/// Class: CubitCommunicationError
///
/// Purpose: CubitCommunicationError class.
///
class CubitCommunicationError extends CubitJumboState {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitCommunicationError({required this.isLoading});
}
