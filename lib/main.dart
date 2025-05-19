//
//  File: main.dart
//
// Purpose: DentLabWeb starting point.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
//

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dentlabweb/presentation/screens/home-page.dart';
import 'package:dentlabweb/presentation/screens/login/login_page.dart';
import 'package:dentlabweb/presentation/screens/order/order_page.dart';
import 'package:dentlabweb/presentation/dentlabweb_theme_constants.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_string_constants.dart';

///
/// DentLabWeb entry point.
///
void main() {
  runApp(const DentLabWebApp());
}

//-------------------------------
// DentLabWeb route configuration
//-------------------------------
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[        
        GoRoute(
          path: '/order',
          builder: (BuildContext context, GoRouterState state) {
            return const OrderPage();
          },
        ),
      ],
    ),
  ],
);

///
/// Class: LoginPage
///
/// Purpose: DentLabWeb main root class.
///
class DentLabWebApp extends StatelessWidget {
  const DentLabWebApp({super.key});

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: DentUIStringConstants.appTitleText,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: DentUIThemeConstants.dentColorGreen,
        ),
      ),
      routerConfig: _router,
    );
  }
}
