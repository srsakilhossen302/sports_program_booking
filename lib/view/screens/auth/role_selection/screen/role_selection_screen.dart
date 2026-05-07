import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/app_colors.dart';
import '../controller/role_selection_controller.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoleSelectionController>(
      init: RoleSelectionController(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(height: 40.h),
                      
                      // Title from Figma
                      Text(
                        "How will you use Sporve?",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic, // Added italic as per Figma
                          height: (60 / 32), // Line height 60px / Size 32px
                          letterSpacing: -1.6.w, // Letter spacing -1.6px
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Choose your account type to get started.",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      
                      // Role Cards
                      _roleCard(
                        title: "Athlete & Family",
                        description: "Find coaches, book sessions, and manage your entire athletic schedule in one place.",
                        icon: Icons.directions_run_rounded,
                        onTap: controller.selectAthlete,
                      ),
                      SizedBox(height: 20.h),
                      _roleCard(
                        title: "Service Provider",
                        description: "Manage your program — bookings, athletes, payments, and more.",
                        icon: Icons.person_rounded,
                        onTap: controller.selectProvider,
                      ),
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

  Widget _roleCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            Container(
              height: 56.h,
              width: 56.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(icon, color: const Color(0xFF0F172A), size: 28.sp),
            ),
            SizedBox(width: 20.w),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF0F172A),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    description,
                    style: TextStyle(
                      color: const Color(0xFF64748B),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            // Arrow
            Icon(Icons.arrow_forward_rounded, color: const Color(0xFF0F172A), size: 24.sp),
          ],
        ),
      ),
    );
  }
}
