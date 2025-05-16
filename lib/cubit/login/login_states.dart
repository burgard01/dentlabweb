//
//  File: login_states.dart
//
// Purpose: DentLabWeb login Cubit login states repository.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 14.05.2025
//

part of 'login_cubit.dart';

abstract class CubitLoginStates {}

///
/// Class: CubitLoginInitial
///
/// Purpose: CubitLoginInitial class.
///
class CubitLoginInitial extends CubitLoginStates {}

///
/// Class: CubitLoginLoading
///
/// Purpose: CubitLoginLoading class.
///
class CubitLoginLoading extends CubitLoginStates {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitLoginLoading({required this.isLoading});
}

///
/// Class: CubitLoginLoaded
///
/// Purpose: CubitLoginLoaded class to hold user data.
///
class CubitLoginLoaded extends CubitLoginStates {
  final UserModel userData;
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitLoginLoaded({required this.isLoading, required this.userData});
}

///
/// Class: CubitLoginError
///
/// Purpose: CubitLoginError class.
///
class CubitLoginError extends CubitLoginStates {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitLoginError({required this.isLoading});
}

///
/// Class: CubitInternalServerError
///
/// Purpose: CubitInternalServerError class.
///
class CubitInternalServerError extends CubitLoginStates {
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
class CubitCommunicationError extends CubitLoginStates {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitCommunicationError({required this.isLoading});
}
