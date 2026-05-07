import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/app_route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../controller/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.splashGradient,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  
                  // Logo and App Name
                  Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.appLogo,
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Sporve",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  
                  const Spacer(flex: 4),
                  
                  // Buttons
                  _socialButton(
                    icon: SvgPicture.asset(AppIcons.googleIcon, width: 24, height: 24),
                    label: "Continue with Google",
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 16),
                  _socialButton(
                    icon: SvgPicture.asset(AppIcons.appleIcon, width: 24, height: 24),
                    label: "Continue with Apple",
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 16),
                  _socialButton(
                    icon: const Icon(Icons.alternate_email_rounded, color: Colors.white, size: 24),
                    label: "Sign Up with Email",
                    onPressed: () => Get.toNamed(AppRoute.signUp),
                    backgroundColor: const Color(0xFF343D4D),
                    textColor: Colors.white,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Login text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const Spacer(),
                  
                  // Footer text
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      "By continuing, you acknowledge and agree to Sporve's Terms of Service and Privacy Policy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _socialButton({
    required Widget icon,
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
