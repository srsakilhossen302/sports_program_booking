import 'package:get/get.dart';

class MissionController extends GetxController {
  // Selected mission
  var selectedMission = "".obs;
  
  // Example missions for Golf (could be dynamic based on sport)
  final List<Map<String, String>> missions = [
    {
      "title": "Break 80 consistently",
      "description": "Lower scoring average this season",
      "icon": "🏆"
    },
    {
      "title": "Make the high school team",
      "description": "Build the foundation for all sports",
      "icon": "🎯"
    },
    {
      "title": "Compete in AJGA events",
      "description": "Junior golf national circuit",
      "icon": "🏋️"
    },
    {
      "title": "Lower my handicap by 5",
      "description": "Focused improvement in one season",
      "icon": "🏠"
    },
  ];

  void selectMission(String title) {
    selectedMission.value = title;
  }

  bool isSelected(String title) {
    return selectedMission.value == title;
  }
}
