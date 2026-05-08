import 'package:get/get.dart';

class SportsSelectionController extends GetxController {
  // Selected sports list
  var selectedSports = <String>[].obs;

  // List of sports with their icons (emojis for 3D look)
  final List<Map<String, String>> sportsList = [
    {"name": "BASKETBALL", "icon": "🏀"},
    {"name": "SOCCER", "icon": "⚽"},
    {"name": "BASEBALL", "icon": "⚾"},
    {"name": "TENNIS", "icon": "🎾"},
    {"name": "MARTIAL ARTS", "icon": "🥋"},
    {"name": "GOLF", "icon": "⛳"},
    {"name": "SOFTBALL", "icon": "🥎"},
    {"name": "SWIMMING", "icon": "🏊"},
    {"name": "FOOTBALL", "icon": "🏈"},
    {"name": "HOCKEY", "icon": "🏒"},
    {"name": "BOXING", "icon": "🥊"},
    {"name": "CRICKET", "icon": "🏏"},
    {"name": "TRACK AND FIELD", "icon": "🏃"},
    {"name": "CROSS COUNTRY", "icon": "🏃‍♂️"},
    {"name": "WATER POLO", "icon": "🤽"},
    {"name": "CREW", "icon": "🚣"},
    {"name": "WEIGHTLIFTING", "icon": "🏋️"},
    {"name": "CHEERLEADING", "icon": "📣"},
    {"name": "DANCE", "icon": "💃"},
    {"name": "BADMINTON", "icon": "🏸"},
    {"name": "VOLLEYBALL", "icon": "🏐"},
    {"name": "FIELD HOCKEY", "icon": "🏑"},
    {"name": "FLAG FOOTBALL", "icon": "🏈"},
    {"name": "LACROSSE", "icon": "🥍"},
    {"name": "GYMNASTICS", "icon": "🤸"},
    {"name": "FRISBEE GOLF", "icon": "🥏"},
    {"name": "SQUASH", "icon": "🎾"},
    {"name": "YOGA", "icon": "🧘"},
    {"name": "WRESTLING", "icon": "🤼"},
    {"name": "FISHING", "icon": "🎣"},
  ];

  void toggleSport(String sport) {
    if (selectedSports.contains(sport)) {
      selectedSports.remove(sport);
    } else {
      selectedSports.add(sport);
    }
  }

  bool isSelected(String sport) {
    return selectedSports.contains(sport);
  }
}
