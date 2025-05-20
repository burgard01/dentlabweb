//
//  File: login_cubit.dart
//
// Purpose: DentLabWeb login Cubit controller.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 14.05.2025
//

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:dentlabweb/data/common/app_data.dart';
import 'package:dentlabweb/cubit/cubit_string_constants.dart';
import 'package:dentlabweb/data/repositories/login_repo.dart';

part 'login_states.dart';

///
/// Class: LoginCubit
///
/// Purpose: Implements the LoginCubit class.
///
class LoginCubit extends Cubit<CubitLoginStates> {
  final LoginRepo loginRepo = LoginRepo();

  ///
  /// Class constructor.
  ///
  LoginCubit() : super(CubitLoginInitial());

  ///
  /// Set obscure password field or not.
  ///
  void setObscurePassword(bool obscure) {
    emit(CubitObscurePassword(obscurePassword: !obscure));
  }

  ///
  /// Logout from protected app pages.
  ///
  void logout() {
    emit(CubitUnauthenticated());
  }

  ///
  /// Get user data with
  ///
  void getUserData(String username, String password) async {
    emit(CubitLoginLoading(isLoading: true));

    // Wait 1 second, then call repository method.
    // Delay is for showing 1 sec LinearProgressIndicator
    Future.delayed(Duration(seconds: 1), () async {
      String response = await loginRepo.login(username, password);

      if (response == CubitStringConstants.commError) {
        emit(CubitCommunicationError(isLoading: false));
      } else if (response == CubitStringConstants.serverIntarnalError) {
        emit(CubitInternalServerError(isLoading: false));
      } else {
        var message = json.decode(response);

        if (message['status'] != 'error') {
          if (message['payload'] != null) {
            //-----------------------------
            // Set app wide data in AppData
            // object (Singleton pattern)
            //-----------------------------
            AppData appData = AppData();
            appData.userID = message['payload']['ID_Benutzer'].toString();
            appData.username = message['payload']['Benutzername'];
            appData.firstName = message['payload']['Vorname'];
            appData.lastName = message['payload']['Nachname'];
            appData.email = message['payload']['Email'];
            appData.role = message['payload']['Rolle'];

            emit(CubitAuthenticated(isLoading: false));
          } else {
            emit(CubitLoginError(isLoading: false));
          }
        } else {
          emit(CubitInternalServerError(isLoading: false));
        }
      }
    });
  }
}
