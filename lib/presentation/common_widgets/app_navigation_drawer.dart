//
//  File: app_navigation_drawer.dart
//
// Purpose: DentLabWeb app wide navigation drawer.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 20.05.2025
// Modified: 20.05.2025
//

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dentlabweb/presentation/constants/dentlabweb_theme_constants.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_string_constants.dart';
import 'package:dentlabweb/presentation/screens/order/order_list_page.dart';
import 'package:dentlabweb/presentation/screens/jumbo/jumbo_list_page.dart';
import 'package:dentlabweb/cubit/login/login_cubit.dart';
import 'package:dentlabweb/router/app_router.dart';

///
/// Class: AppNavigationDrawer
///
/// Purpose: Implements the AppNavigationDrawer app
/// wide navigation drawer widget.
///
class AppNavigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 1);

  ///
  /// Class constructor.
  ///
  AppNavigationDrawer({super.key});

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 150.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/images/burgardental_logo_300.png'),
                    scale: 2.0,
                  ),
                ),
                margin: EdgeInsets.zero,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 6.0,
                      left: 4.0,
                      child: Text(
                        "DentLabWeb v0.9.1",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            buildMenuItem(
              text: DentUIStringConstants.navDrawerOrderTitleText,
              icon: Icons.arrow_right,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: DentUIStringConstants.navDrawerJumboTitleText,
              icon: Icons.shopping_bag,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: DentUIStringConstants.navDrawerPositionsTitleText,
              icon: Icons.format_list_bulleted,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: DentUIStringConstants.navDrawerInvoiceTitleText,
              icon: Icons.receipt,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: DentUIStringConstants.navDrawerMonthlyInvoicesTitleText,
              icon: Icons.calendar_month,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: DentUIStringConstants.navDrawerStatisticsTitleText,
              icon: Icons.bar_chart_outlined,
              onClicked: () => selectedItem(context, 5),
            ),
            Divider(),
            const SizedBox(height: 16),
            buildMenuItem(
              text: DentUIStringConstants.navDrawerLogoutTitleText,
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 6),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Build Drawer menu item with given text and given icon.
  ///
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final hoverColor = DentUIThemeConstants.dentColorGreen;

    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  ///
  /// Navigate to pages, corresponding to
  /// selected navigation drawer index.
  ///
  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0: // Order (Aufträge) page
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => OrderListPage()));
        break;
      case 1: // Jumbo page
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => JumboListPage()));
        break;
      case 6: // Logout & route to login page
        BlocProvider.of<LoginCubit>(context).logout();
        GoRouter.of(context).go(AppRouter.orderPath);
        break;
    }
  }
}
