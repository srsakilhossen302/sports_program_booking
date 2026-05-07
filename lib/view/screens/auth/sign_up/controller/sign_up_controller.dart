import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  var isAgreed = false.obs;
  var isPasswordVisible = false.obs;
  
  // Reactive bool to track if all fields are filled
  var isAllFieldsFilled = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Add listeners to all controllers to check if fields are filled
    firstNameController.addListener(_checkFields);
    lastNameController.addListener(_checkFields);
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
    ever(isAgreed, (_) => _checkFields());
  }

  void _checkFields() {
    isAllFieldsFilled.value = firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isAgreed.value;
  }

  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
