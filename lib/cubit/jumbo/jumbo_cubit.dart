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

part 'jumbo_states.dart';

///
/// Class: JumboCubit
///
/// Purpose: Implements the JumboCubit class.
///
class JumboCubit extends Cubit<CubitJumboStates> {
  final JumboRepo loginRepo = JumboRepo();

  ///
  /// Class constructor.
  ///
  JumboCubit() : super(CubitJumbonInitial());
}
