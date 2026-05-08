import 'package:get/get.dart';
import '../data/services/api_client.dart';
import '../view/screens/splash/controller/splash_controller.dart';
import '../view/screens/auth/controller/auth_controller.dart';
import '../view/screens/auth/sign_up/controller/sign_up_controller.dart';
import '../view/screens/auth/sign_in/controller/sign_in_controller.dart';
import '../view/screens/auth/verification/controller/verification_controller.dart';
import '../view/screens/auth/role_selection/controller/role_selection_controller.dart';
import '../view/screens/athlete_family/sports_selection/controller/sports_selection_controller.dart';
import '../view/screens/athlete_family/identity/controller/identity_controller.dart';
import '../view/screens/booking/controller/booking_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => VerificationController(), fenix: true);
    Get.lazyPut(() => RoleSelectionController(), fenix: true);
    Get.lazyPut(() => SportsSelectionController(), fenix: true);
    Get.lazyPut(() => IdentityController(), fenix: true);
    Get.lazyPut(() => BookingController(), fenix: true);
  }
}
