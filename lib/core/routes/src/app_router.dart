import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Pages {
  // splash
  splash,
  // auth
  login,
  signup,
  // bottom nav bar
  app,
  // home
  home,
  productDetails,
  // cart
  cart,
  // favorite
  favorite,
  // profile
  profile,
  // search
  search,
}

class AppRouter {
  AppRouter();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static late StatefulNavigationShell navigationBottomBarShell;

  static final homeShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'home');
  static final searchShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'search');
  static final cartShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'cart');
  static final profileShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'profile');
}
