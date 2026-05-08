import 'package:get/get.dart';
import '../../sports_selection/controller/sports_selection_controller.dart';
import '../../identity/controller/identity_controller.dart';
import '../../mission/controller/mission_controller.dart';

class ReviewController extends GetxController {
  // We can inject the other controllers to get the data
  final SportsSelectionController sportsController = Get.find<SportsSelectionController>();
  final IdentityController identityController = Get.find<IdentityController>();
  final MissionController missionController = Get.find<MissionController>();

  String get userName => identityController.nameController.text.isEmpty 
      ? "User Name" 
      : identityController.nameController.text;

  String get ageRange => identityController.selectedAgeRange.value.isEmpty 
      ? "Not set" 
      : identityController.selectedAgeRange.value;

  List<String> get selectedSports => sportsController.selectedSports;

  String get selectedMission => missionController.selectedMission.value.isEmpty 
      ? "No mission selected" 
      : missionController.selectedMission.value;
}
