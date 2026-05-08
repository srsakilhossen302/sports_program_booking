import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/app_route.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../controller/identity_controller.dart';

class IdentityScreen extends StatelessWidget {
  const IdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IdentityController>(
      init: IdentityController(),
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
                            "STEP 2 OF 4",
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
                        "Identity",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 42.sp, // Slightly larger
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          height: 1.1,
                          letterSpacing: -2.0.w,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      
                      // Content Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(48.r), // More rounded
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Identity Toggle
                            Row(
                              children: [
                                Expanded(
                                  child: _buildIdentityButton(
                                    controller: controller,
                                    label: "PARENTS",
                                    svgPath: AppIcons.parentsIcon,
                                    type: "Parents",
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: _buildIdentityButton(
                                    controller: controller,
                                    label: "ATHLETES",
                                    icon: Icons.directions_run_rounded,
                                    type: "Athletes",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.h),
                            
                            // Full Name Section
                            Text(
                              "FULL NAME",
                              style: GoogleFonts.inter(
                                color: const Color(0xFF94A3B8),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.0,
                              ),
                            ),
                            SizedBox(height: 14.h),
                            TextField(
                              controller: controller.nameController,
                              style: TextStyle(color: const Color(0xFF0F172A), fontSize: 18.sp, fontWeight: FontWeight.w800),
                              decoration: InputDecoration(
                                hintText: "e.g. Alex Burton",
                                hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 18.sp, fontWeight: FontWeight.w700),
                                fillColor: const Color(0xFFF8FAFC),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.r),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                              ),
                            ),
                            SizedBox(height: 40.h),
                            
                            // Age Range Section
                            Text(
                              "AGE RANGE",
                              style: GoogleFonts.inter(
                                color: const Color(0xFF94A3B8),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.0,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Wrap(
                              spacing: 12.w,
                              runSpacing: 12.h,
                              children: controller.ageRanges.map((range) {
                                return Obx(() {
                                  final isSelected = controller.selectedAgeRange.value == range;
                                  return GestureDetector(
                                    onTap: () => controller.setAgeRange(range),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
                                      decoration: BoxDecoration(
                                        color: isSelected ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                                        borderRadius: BorderRadius.circular(32.r),
                                        border: Border.all(
                                          color: isSelected ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                                          width: 1.5,
                                        ),
                                        boxShadow: isSelected ? [
                                          BoxShadow(
                                            color: const Color(0xFF0F172A).withOpacity(0.2),
                                            blurRadius: 10,
                                            offset: const Offset(0, 4),
                                          )
                                        ] : null,
                                      ),
                                      child: Text(
                                        range,
                                        style: TextStyle(
                                          color: isSelected ? Colors.white : const Color(0xFF94A3B8),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              }).toList(),
                            ),
                            SizedBox(height: 12.h),
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
                                  Get.toNamed(AppRoute.mission);
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
                                      "NEXT",
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

  Widget _buildIdentityButton({
    required IdentityController controller,
    required String label,
    IconData? icon,
    String? svgPath,
    required String type,
  }) {
    return Obx(() {
      final isSelected = controller.identityType.value == type;
      return GestureDetector(
        onTap: () => controller.setIdentityType(type),
        child: Container(
          height: 64.h,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0F172A) : Colors.white,
            borderRadius: BorderRadius.circular(32.r),
            border: Border.all(
              color: isSelected ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isSelected ? 0.2 : 0.05),
                blurRadius: isSelected ? 15 : 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (svgPath != null)
                SvgPicture.asset(
                  svgPath,
                  colorFilter: ColorFilter.mode(
                    isSelected ? Colors.white : const Color(0xFF0F172A),
                    BlendMode.srcIn,
                  ),
                  height: 20.sp,
                )
              else if (icon != null)
                Icon(
                  icon,
                  color: isSelected ? Colors.white : const Color(0xFF0F172A),
                  size: 20.sp,
                ),
              SizedBox(width: 10.w),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: isSelected ? Colors.white : const Color(0xFF0F172A),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
