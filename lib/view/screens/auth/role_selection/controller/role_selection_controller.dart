import 'package:get/get.dart';
import '../../../../../core/app_route.dart';
import '../../../../../data/helpers/shared_prefe.dart';

class RoleSelectionController extends GetxController {
  void selectAthlete() async {
    // Save role as 'family roll' as per user request
    await SharedPrefe.setRole('family roll');
    // Navigate to sports selection
    Get.toNamed(AppRoute.sportsSelection);
  }

  void selectProvider() async {
    // Save role as 'provider roll' (consistency)
    await SharedPrefe.setRole('provider roll');
    // Navigate to provider setup (if implemented)
  }
}
