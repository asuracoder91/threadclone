import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/authentications/views/login_screen.dart';
import 'package:thread/authentications/views/signup_screen.dart';
import 'package:thread/main/view/activity_page.dart';
import 'package:thread/main/view/list_page.dart';
import 'package:thread/main/view/privacy_screen.dart';
import 'package:thread/main/view/settings_screen.dart';
import 'package:thread/main/view/shoot_photo_screen.dart';
import 'authentications/repos/authentication_repo.dart';
import 'main/view/search_page.dart';
import 'main/view/user_page.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != SignUpScreen.routeURL &&
            state.matchedLocation != LoginScreen.routeURL) {
          return LoginScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: "/:tab(|search|activity|profile)",
        name: ListPage.routeName,
        builder: (context, state) {
          final tab = state.pathParameters["tab"]!;
          return ListPage(tab: tab);
        },
      ),
      GoRoute(
        name: SearchPage.routeName,
        path: SearchPage.routeURL,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        name: ActivityPage.routeName,
        path: ActivityPage.routeURL,
        builder: (context, state) => const ActivityPage(),
      ),
      GoRoute(
        name: UserPage.routeName,
        path: UserPage.routeURL,
        builder: (context, state) => const UserPage(),
      ),
      GoRoute(
        name: ShootPhotoScreen.routeName,
        path: ShootPhotoScreen.routeURL,
        builder: (context, state) => const ShootPhotoScreen(),
      ),
      GoRoute(
        name: SettingsScreen.routeName,
        path: SettingsScreen.routeURL,
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            name: PrivacyScreen.routeName,
            path: PrivacyScreen.routeURL,
            builder: (context, state) => const PrivacyScreen(),
          ),
        ],
      ),
    ],
  );
});
