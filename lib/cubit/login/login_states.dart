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

///
/// Class: CubitObscurePassword
///
/// Purpose: CubitObscurePassword class.
///
class CubitObscurePassword extends CubitLoginStates {
  final bool obscurePassword;

  ///
  /// Class constructor.
  ///
  CubitObscurePassword({required this.obscurePassword});
}

///
/// Class: CubitAuthenticated
///
/// Purpose: CubitAuthenticated class.
///
class CubitAuthenticated extends CubitLoginStates {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitAuthenticated({required this.isLoading});
}

///
/// Class: CubitUnauthenticated
///
/// Purpose: CubitUnauthenticated class.
///
class CubitUnauthenticated extends CubitLoginStates {
  ///
  /// Class constructor.
  ///
  CubitUnauthenticated();
}
