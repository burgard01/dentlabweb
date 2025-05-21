//
// File: jumbo_list_page.dart
//
// Purpose: DentLabWeb Jumbo list page.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 19.05.2025
// Modified: 21.05.2025
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dentlabweb/cubit/jumbo/jumbo_cubit.dart';
import 'package:dentlabweb/presentation/screens/jumbo/jumbo_list_form.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_theme_constants.dart';
import 'package:dentlabweb/presentation/common_widgets/app_navigation_drawer.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_string_constants.dart';

///
/// Class: JumboPage
///
/// Purpose: DentLabWeb jumbo list page implementation.
///
class JumboListPage extends StatelessWidget {
  final JumboCubit jumboCubit = JumboCubit();

  ///
  /// Class constructor.
  ///
  JumboListPage({super.key});

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppNavigationDrawer(),
      appBar: AppBar(
        foregroundColor: DentUIThemeConstants.dentLightTextColor,
        backgroundColor: DentUIThemeConstants.dentColorGreen,
        title: Text(
          DentUIStringConstants.jumboPageAppbarText,
          style: const TextStyle(
            color: DentUIThemeConstants.dentLightTextColor,
            fontFamily: DentUIThemeConstants.dentFontFamily,
            fontSize: DentUIThemeConstants.dentAppBarTitleFontsize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocProvider<JumboCubit>(
        create: (context) => jumboCubit,
        child: JumboListForm(),
      ),
    );
  }
}
