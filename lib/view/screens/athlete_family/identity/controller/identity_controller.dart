import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdentityController extends GetxController {
  // Identity type (Parents or Athletes)
  var identityType = "Parents".obs;
  
  // Full name controller
  final TextEditingController nameController = TextEditingController();
  
  // Selected age range
  var selectedAgeRange = "".obs;
  
  final List<String> ageRanges = [
    "8-10",
    "11-13",
    "14-17",
    "18+",
  ];

  void setIdentityType(String type) {
    identityType.value = type;
  }

  void setAgeRange(String range) {
    selectedAgeRange.value = range;
  }

  bool get isAllFieldsFilled => 
    nameController.text.isNotEmpty && selectedAgeRange.value.isNotEmpty;

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
