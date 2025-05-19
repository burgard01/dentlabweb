//
// File: order_page.dart
//
// Purpose: DentLabWeb Order (Aufträge) page.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 19.05.2025
//

import 'package:dentlabweb/cubit/login/login_cubit.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_string_constants.dart';
import 'package:flutter/material.dart';

import 'package:dentlabweb/presentation/screens/login/login_form.dart';
import 'package:dentlabweb/presentation/dentlabweb_theme_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
/// Class: OrderPage
///
/// Purpose: DentLabWeb order (Aufträge) page implementation.
///
class OrderPage extends StatelessWidget {
  ///
  /// Class constructor.
  ///
  const OrderPage({super.key});

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DentUIThemeConstants.dentColorGreen,
        title: Text(
          DentUIStringConstants.orderPageAppbarText,
          style: const TextStyle(
            color: DentUIThemeConstants.dentLightTextColor,
            fontFamily: DentUIThemeConstants.dentFontFamily,
            fontSize: DentUIThemeConstants.dentAppBarTitleFontsize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Placeholder(),
    );
  }
}
