import 'package:get/get.dart';
import '../view/screens/splash/screen/splash_screen.dart';
import '../view/screens/auth/screen/auth_screen.dart';
import '../view/screens/auth/sign_up/screen/sign_up_screen.dart';
import '../view/screens/auth/sign_in/screen/sign_in_screen.dart';
import '../view/screens/auth/verification/screen/verification_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String signUp = '/sign_up';
  static const String signIn = '/sign_in';
  static const String verification = '/verification';
  static const String booking = '/booking';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: auth, page: () => const AuthScreen()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
    GetPage(name: verification, page: () => const VerificationScreen()),
  ];
}
