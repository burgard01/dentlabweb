//
//  File: login_states.dart
//
// Purpose: DentLabWeb login Cubit states.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 14.05.2025
// Modified: 14.05.2025
//

part of 'login_cubit.dart';

abstract class CubitLoginState {}

///
/// Class: CubitLoginInitial
///
/// Purpose: CubitLoginInitial class.
///
class CubitLoginInitial extends CubitLoginState {}

///
/// Class: CubitLoginLoading
///
/// Purpose: CubitLoginLoading class.
///
class CubitLoginLoading extends CubitLoginState {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitLoginLoading({required this.isLoading});
}

///
/// Class: CubitObscurePassword
///
/// Purpose: CubitObscurePassword class.
///
class CubitObscurePassword extends CubitLoginState {
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
class CubitAuthenticated extends CubitLoginState {
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
class CubitUnauthenticated extends CubitLoginState {
  ///
  /// Class constructor.
  ///
  CubitUnauthenticated();
}

///
/// Class: CubitLoginError
///
/// Purpose: CubitLoginError class.
///
class CubitLoginError extends CubitLoginState {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitLoginError({required this.isLoading});
}

//--- Error states ------------------------------------------------------------

///
/// Class: CubitInternalServerError
///
/// Purpose: CubitInternalServerError class.
///
class CubitInternalServerError extends CubitLoginState {
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
class CubitCommunicationError extends CubitLoginState {
  final bool isLoading;

  ///
  /// Class constructor.
  ///
  CubitCommunicationError({required this.isLoading});
}
