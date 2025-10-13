import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/routes/routes.dart';
import 'package:verdora_app/feature/cart/view/view.dart';
import 'package:verdora_app/feature/favorite/view/src/favorite_page.dart';
import 'package:verdora_app/feature/home/view/src/home_page.dart';
import 'package:verdora_app/feature/profile/view/src/profile_page.dart';
import 'package:verdora_app/feature/splash/view/src/splash_page.dart';

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
    debugLabel: 'home',
  );
  static final favoriteShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'favorite',
  );
  static final cartShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'cart',
  );
  static final profileShellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'profile',
  );

  static GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      if (kDebugMode) {
        print('Route fullPath: ${state.fullPath}');
      }
      return null;
    },
    errorPageBuilder: (context, state) {
      return NotFoundScreen.page(key: state.pageKey);
    },
    routes: [
      // splash
      GoRoute(
        name: Pages.splash.name,
        path: '/',
        pageBuilder: (context, state) => SplashPage.page(key: state.pageKey),
      ),
      // Main App Route with Bottom Navigation
      GoRoute(
        name: Pages.app.name,
        path: '/app',
        redirect: (context, state) =>
            state.fullPath == '/app' ? '/app/home' : null,
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              navigationBottomBarShell = navigationShell;
              return BottomNavigationPage(child: navigationShell);
            },
            branches: [
              StatefulShellBranch(
                navigatorKey: homeShellNavigatorKey,
                routes: [
                  GoRoute(
                    path: 'home',
                    name: Pages.home.name,
                    pageBuilder: (context, state) =>
                        HomePage.page(key: state.pageKey),
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: cartShellNavigatorKey,
                routes: [
                  GoRoute(
                    path: 'cart',
                    name: Pages.cart.name,
                    pageBuilder: (context, state) =>
                        CartPage.page(key: state.pageKey),
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: favoriteShellNavigatorKey,
                routes: [
                  GoRoute(
                    path: 'favorite',
                    name: Pages.favorite.name,
                    pageBuilder: (context, state) =>
                        FavoritePage.page(key: state.pageKey),
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: profileShellNavigatorKey,
                routes: [
                  GoRoute(
                    path: 'profile',
                    parentNavigatorKey: profileShellNavigatorKey,
                    name: Pages.profile.name,
                    pageBuilder: (context, state) =>
                        ProfilePage.page(key: state.pageKey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({required this.child, super.key});
  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  late Pages _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab =
        Pages.values[AppRouter.navigationBottomBarShell.currentIndex];
  }

  void _handleIndexChanged(int index) {
    final tab = Pages.values[index];
    if (tab != _selectedTab) {
      setState(() => _selectedTab = tab);
      AppRouter.navigationBottomBarShell.goBranch(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.child,
      extendBody: true,
      bottomNavigationBar: CrystalNavigationBar(
        backgroundColor: context.colors.primary.withValues(alpha: 0.15),
        currentIndex: Pages.values.indexOf(_selectedTab),
        unselectedItemColor: context.colors.dark,
        indicatorColor: context.colors.primary,
        onTap: _handleIndexChanged,
        borderRadius: 15,
        items: [
          CrystalNavigationBarItem(
            icon: IconsaxPlusBold.home_1,
            unselectedIcon: IconsaxPlusLinear.home_1,
            selectedColor: context.colors.primary,
          ),
          CrystalNavigationBarItem(
            icon: IconsaxPlusBold.shopping_bag,
            unselectedIcon: IconsaxPlusLinear.shopping_bag,
            selectedColor: context.colors.primary,
          ),
          CrystalNavigationBarItem(
            icon: IconsaxPlusBold.heart,
            unselectedIcon: IconsaxPlusLinear.heart,
            selectedColor: context.colors.primary,
          ),
          CrystalNavigationBarItem(
            icon: IconsaxPlusBold.profile_circle,
            unselectedIcon: IconsaxPlusLinear.profile_circle,
            selectedColor: context.colors.primary,
          ),
        ],
      ),
    );
  }
}
