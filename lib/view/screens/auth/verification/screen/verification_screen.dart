import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/app_route.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../controller/verification_controller.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationController>(
      init: VerificationController(),
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
                        width: double.infinity,
                        constraints: BoxConstraints(minHeight: 600.h), // Increased height of the white card
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Smartphone Icon from SVG
                            Container(
                              height: 56.h,
                              width: 56.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0F172A),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              padding: EdgeInsets.all(14.r),
                              child: SvgPicture.asset(
                                AppIcons.phoneIcon,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              "Verify Email",
                              style: TextStyle(
                                color: const Color(0xFF0F172A),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w900, // Bolder title
                                letterSpacing: -0.8,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text.rich(
                              TextSpan(
                                text: "We sent a 6-digit code to ",
                                style: TextStyle(
                                  color: const Color(0xFF64748B),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6, // Increased line height/spacing
                                  letterSpacing: 0.2,
                                ),
                                children: [
                                  TextSpan(
                                    text: "sporve@gmail.com",
                                    style: TextStyle(color: const Color(0xFF0F172A), fontWeight: FontWeight.w700),
                                  ),
                                  const TextSpan(text: " Enter it below."),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.h),
                            
                            // OTP Fields (Pinput)
                            Center(
                              child: Pinput(
                                length: 6,
                                controller: controller.otpController,
                                focusNode: controller.focusNode,
                                defaultPinTheme: PinTheme(
                                  width: 48.w,
                                  height: 56.h,
                                  textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color(0xFF0F172A),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8FAFC),
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(color: const Color(0xFFE2E8F0)),
                                  ),
                                ),
                                focusedPinTheme: PinTheme(
                                  width: 48.w,
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(color: AppColors.primaryColor, width: 2),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 48.h),
                            
                            // Verify Button
                            SizedBox(
                              width: double.infinity,
                              height: 60.h,
                              child: ElevatedButton(
                                onPressed: () {
                                    Get.toNamed(AppRoute.roleSelection);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0A1020),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                                child: Text(
                                  "VERIFY & CONTINUE",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.5,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 32.h),
                            
                            // Resend code link
                            Center(
                              child: GestureDetector(
                                onTap: controller.resendCode,
                                child: Text(
                                  "Resend code",
                                  style: TextStyle(
                                    color: const Color(0xFF3D5CFF),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
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
}
