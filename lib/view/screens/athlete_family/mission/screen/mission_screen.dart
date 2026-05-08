import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_route.dart';
import '../../../../../core/utils/app_colors.dart';
import '../controller/mission_controller.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MissionController>(
      init: MissionController(),
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
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
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
                          Text(
                            "STEP 3 OF 4",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 4.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      // Title
                      Text(
                        "Your Golf Mission",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          height: 1.2,
                          letterSpacing: -1.2.w,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      // Subtitle
                      Text(
                        "What do you want to achieve in Golf this year?",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      
                      // Content Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        child: Column(
                          children: [
                            ...controller.missions.map((mission) {
                              return _buildMissionCard(
                                controller: controller,
                                title: mission['title']!,
                                description: mission['description']!,
                                icon: mission['icon']!,
                              );
                            }).toList(),
                            
                            // "Not Sure Yet" Card
                            SizedBox(height: 12.h),
                            GestureDetector(
                              onTap: () => controller.selectMission("Not Sure Yet"),
                              child: Obx(() {
                                final isSelected = controller.isSelected("Not Sure Yet");
                                return Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 24.h),
                                  decoration: BoxDecoration(
                                    color: isSelected ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Not Sure Yet",
                                      style: GoogleFonts.inter(
                                        color: isSelected ? Colors.white : const Color(0xFF0F172A),
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 40.h),
                      
                      // Bottom Buttons
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 64.h,
                              child: OutlinedButton(
                                onPressed: () => Get.back(),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.white.withOpacity(0.15)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.r),
                                  ),
                                  backgroundColor: const Color(0xFF0F1E3A).withOpacity(0.4),
                                ),
                                child: Text(
                                  "BACK",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 64.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(AppRoute.review);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF0F172A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.r),
                                  ),
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "REVIEW",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 2.5,
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Icon(Icons.arrow_forward_rounded, size: 22.sp),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
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

  Widget _buildMissionCard({
    required MissionController controller,
    required String title,
    required String description,
    required String icon,
  }) {
    return Obx(() {
      final isSelected = controller.isSelected(title);
      return GestureDetector(
        onTap: () => controller.selectMission(title),
        child: Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(32.r),
            border: Border.all(
              color: isSelected ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              // Icon Container
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white.withOpacity(0.1) : Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Center(
                  child: Text(icon, style: TextStyle(fontSize: 24.sp)),
                ),
              ),
              SizedBox(width: 16.w),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: isSelected ? Colors.white : const Color(0xFF0F172A),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      description,
                      style: TextStyle(
                        color: isSelected ? Colors.white.withOpacity(0.6) : const Color(0xFF94A3B8),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Checkmark
              if (isSelected)
                Icon(Icons.check_rounded, color: Colors.white, size: 24.sp),
            ],
          ),
        ),
      );
    });
  }
}
