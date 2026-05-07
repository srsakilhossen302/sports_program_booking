import 'package:get/get.dart';
import '../view/screens/splash/screen/splash_screen.dart';
import '../view/screens/auth/screen/auth_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String booking = '/booking';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: auth, page: () => const AuthScreen()),
  ];
}
