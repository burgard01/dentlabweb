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
import 'package:dentlabweb/cubit/cubit_string_constants.dart';
import 'package:dentlabweb/data/repositories/login_repo.dart';
import 'package:meta/meta.dart';

import 'package:dentlabweb/data/models/user.dart';

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
  /// Get user data with
  ///
  getUserData(String username, String password) async {
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

        if (message['status'] != "error") {
          if (message["payload"].isNotEmpty) {
            UserModel userModel = UserModel.fromJson(message["payload"][0]);
            emit(CubitLoginLoaded(isLoading: false, userData: userModel));
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
