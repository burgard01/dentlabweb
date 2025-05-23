//
//  File: main.dart
//
// Purpose: DentLabWeb starting point.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
// Modified: 21.05.2025
//   - MultiBlocProvider inserted
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:dentlabweb/router/app_router.dart';
import 'package:dentlabweb/cubit/login/login_cubit.dart';
import 'package:dentlabweb/cubit/jumbo/jumbo_cubit.dart';
import 'package:dentlabweb/presentation/screens/login/login_page.dart';
import 'package:dentlabweb/presentation/screens/order/order_list_page.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_theme_constants.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_string_constants.dart';

///
/// DentLabWeb entry point.
///
void main() {
  runApp(DentLabWebApp());
}

///
/// Class: LoginPage
///
/// Purpose: DentLabWeb main root class.
///
class DentLabWebApp extends StatelessWidget {
  final LoginCubit loginCubit = LoginCubit();
  final JumboCubit jumboCubit = JumboCubit();

  ///
  /// Class constructor.
  ///
  DentLabWebApp({super.key});

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    //-------------------------------
    // DentLabWeb route configuration
    //-------------------------------
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          // Home route '/' for login page
          path: AppRouter.loginPath,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: AppRouter.orderPath,
              builder: (BuildContext context, GoRouterState state) {
                return const OrderListPage();
              },
            ),
          ],
          redirect: (BuildContext context, GoRouterState state) {
            final isAuthenticated = loginCubit.state is CubitAuthenticated;

            if (!isAuthenticated) {
              return AppRouter.loginPath;
            }

            return null;
          },
        ),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => loginCubit),
        BlocProvider<JumboCubit>(create: (context) => jumboCubit),
      ],
      child: MaterialApp.router(
        title: DentUIStringConstants.appTitleText,
        debugShowCheckedModeBanner: false,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: DentUIThemeConstants.dentColorGreen,
          ),
        ),
      ),
    );
  }
}
