import 'package:get/get.dart';
import '../view/screens/splash/screen/splash_screen.dart';
import '../view/screens/auth/screen/auth_screen.dart';
import '../view/screens/auth/sign_up/screen/sign_up_screen.dart';
import '../view/screens/auth/sign_in/screen/sign_in_screen.dart';
import '../view/screens/auth/verification/screen/verification_screen.dart';
import '../view/screens/auth/role_selection/screen/role_selection_screen.dart';
import '../view/screens/athlete_family/sports_selection/screen/sports_selection_screen.dart';
import '../view/screens/athlete_family/identity/screen/identity_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String signUp = '/sign_up';
  static const String signIn = '/sign_in';
  static const String verification = '/verification';
  static const String roleSelection = '/role_selection';
  static const String sportsSelection = '/sports_selection';
  static const String identity = '/identity';
  static const String booking = '/booking';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: auth, page: () => const AuthScreen()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
    GetPage(name: verification, page: () => const VerificationScreen()),
    GetPage(name: roleSelection, page: () => const RoleSelectionScreen()),
    GetPage(name: sportsSelection, page: () => const SportsSelectionScreen()),
    GetPage(name: identity, page: () => const IdentityScreen()),
  ];
}
