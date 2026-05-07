import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
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
                                // shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(12.r),
                              child: SvgPicture.asset(AppIcons.appLogo),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "Create your account",
                              style: TextStyle(
                                color: const Color(0xFF0F172A),
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -0.8,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "Step 1 of 2 — Your details",
                              style: TextStyle(
                                color: const Color(0xFF64748B),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 32.h),
                            
                            // Name Fields
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                    label: "FIRST NAME",
                                    hint: "Alex",
                                    controller: controller.firstNameController,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: _buildTextField(
                                    label: "LAST NAME",
                                    hint: "Burton",
                                    controller: controller.lastNameController,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            
                            // Email Field
                            _buildTextField(
                              label: "EMAIL ADDRESS",
                              hint: "alex@example.com",
                              controller: controller.emailController,
                            ),
                            SizedBox(height: 20.h),
                            
                            // Password Field
                            Obx(() => _buildTextField(
                              label: "PASSWORD",
                              hint: "Min. 8 characters",
                              controller: controller.passwordController,
                              isPassword: true,
                              obscureText: !controller.isPasswordVisible.value,
                              onSuffixIconPressed: controller.togglePasswordVisibility,
                            )),
                            SizedBox(height: 32.h),
                            
                            // Agreement Checkbox
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(() => GestureDetector(
                                  onTap: controller.toggleAgreement,
                                  child: Container(
                                    height: 24.h,
                                    width: 24.w,
                                    margin: EdgeInsets.only(top: 2.h),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: controller.isAgreed.value ? AppColors.primaryColor : const Color(0xFFE2E8F0),
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(7.r),
                                      color: controller.isAgreed.value ? AppColors.primaryColor : Colors.transparent,
                                    ),
                                    child: controller.isAgreed.value 
                                        ? Icon(Icons.check, color: Colors.white, size: 14.sp)
                                        : null,
                                  ),
                                )),
                                SizedBox(width: 14.w),
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(
                                      text: "I agree to Sporve's ",
                                      style: TextStyle(color: const Color(0xFF64748B), fontSize: 13.sp, height: 1.5),
                                      children: [
                                        TextSpan(
                                          text: "Terms of Service",
                                          style: TextStyle(color: const Color(0xFF0F172A), fontWeight: FontWeight.w800, decoration: TextDecoration.underline, fontSize: 13.sp),
                                        ),
                                        const TextSpan(text: " and "),
                                        TextSpan(
                                          text: "Privacy Policy",
                                          style: TextStyle(color: const Color(0xFF0F172A), fontWeight: FontWeight.w800, decoration: TextDecoration.underline, fontSize: 13.sp),
                                        ),
                                        const TextSpan(text: ", and confirm I am 13 years or older."),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.h),
                            
                            // Continue Button
                            SizedBox(
                              width: double.infinity,
                              height: 60.h,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF1F5F9),
                                  foregroundColor: const Color(0xFF94A3B8),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "CONTINUE",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 2.5,
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Icon(Icons.arrow_forward_rounded, size: 22.sp, color: Colors.grey.shade400),
                                  ],
                                ),
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
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onSuffixIconPressed,
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
          obscureText: obscureText,
          style: TextStyle(color: const Color(0xFF0F172A), fontSize: 16.sp, fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 16.sp, fontWeight: FontWeight.w500),
            fillColor: const Color(0xFFF8FAFC),
            filled: true,
            suffixIcon: isPassword 
                ? IconButton(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Text(
                        obscureText ? "👁️" : "👁️‍🗨️",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ),
                    onPressed: onSuffixIconPressed,
                  )
                : null,
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
