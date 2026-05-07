import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/app_route.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../controller/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.splashGradient,
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      // Back Button
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E2737),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.arrow_back, color: Colors.white, size: 16.sp),
                                SizedBox(width: 8.w),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      // Divider line
                      Container(
                        width: 45.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      
                      // Main Card
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Logo
                            Container(
                              height: 56.h,
                              width: 56.w,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                color: Color(0xFF0F172A),
                              ),
                              padding: EdgeInsets.all(12.r),
                              child: SvgPicture.asset(AppIcons.appLogo),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "Welcome back",
                              style: TextStyle(
                                color: const Color(0xFF0F172A),
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -0.8,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "Sign in to your Sporve account",
                              style: TextStyle(
                                color: const Color(0xFF64748B),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 32.h),
                            
                            // Email Field
                            _buildTextField(
                              label: "EMAIL ADDRESS",
                              hint: "alex@example.com",
                              controller: controller.emailController,
                            ),
                            SizedBox(height: 20.h),
                            
                            // Password Field
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PASSWORD",
                                  style: TextStyle(
                                    color: const Color(0xFF94A3B8),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                      color: const Color(0xFF3D5CFF),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Obx(() => TextField(
                              controller: controller.passwordController,
                              obscureText: !controller.isPasswordVisible.value,
                              style: TextStyle(color: const Color(0xFF0F172A), fontSize: 16.sp, fontWeight: FontWeight.w700),
                              decoration: InputDecoration(
                                hintText: "Your password",
                                hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 16.sp, fontWeight: FontWeight.w500),
                                fillColor: const Color(0xFFF8FAFC),
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isPasswordVisible.value ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                                    color: const Color(0xFF94A3B8),
                                    size: 20.sp,
                                  ),
                                  onPressed: controller.togglePasswordVisibility,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                              ),
                            )),
                            SizedBox(height: 40.h),
                            
                            // Sign In Button
                            SizedBox(
                              width: double.infinity,
                              height: 60.h,
                              child: ElevatedButton(
                                onPressed: controller.signIn,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0A1020),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.5,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            
                            // Sign Up Footer
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      color: const Color(0xFF64748B),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.offNamed(AppRoute.signUp),
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                        color: const Color(0xFF3D5CFF),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF94A3B8),
            fontSize: 11.sp,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          style: TextStyle(color: const Color(0xFF0F172A), fontSize: 16.sp, fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 16.sp, fontWeight: FontWeight.w500),
            fillColor: const Color(0xFFF8FAFC),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          ),
        ),
      ],
    );
  }
}
