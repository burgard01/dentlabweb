//
// File: billingitems_page.dart
//
// Purpose: DentLabWeb Billing items page.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 19.05.2025
// Modified: 19.05.2025
//

import 'package:flutter/material.dart';

import 'package:dentlabweb/presentation/constants/dentlabweb_theme_constants.dart';
import 'package:dentlabweb/presentation/common_widgets/app_navigation_drawer.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_string_constants.dart';

///
/// Class: BillingItemsPage
///
/// Purpose: DentLabWeb billing items (Abrechnungspositionen) page implementation.
///
class BillingItemsPage extends StatelessWidget {
  ///
  /// Class constructor.
  ///
  const BillingItemsPage({super.key});

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppNavigationDrawer(),
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
