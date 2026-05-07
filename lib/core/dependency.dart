import 'package:get/get.dart';
import '../data/services/api_client.dart';
import '../view/screens/splash/controller/splash_controller.dart';
import '../view/screens/auth/controller/auth_controller.dart';
import '../view/screens/auth/sign_up/controller/sign_up_controller.dart';
import '../view/screens/auth/verification/controller/verification_controller.dart';
import '../view/screens/booking/controller/booking_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => VerificationController(), fenix: true);
    Get.lazyPut(() => BookingController(), fenix: true);
  }
}
