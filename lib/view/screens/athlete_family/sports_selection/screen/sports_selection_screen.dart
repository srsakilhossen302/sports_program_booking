import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_route.dart';
import '../../../../../core/utils/app_colors.dart';
import '../controller/sports_selection_controller.dart';

class SportsSelectionScreen extends StatelessWidget {
  const SportsSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SportsSelectionController>(
      init: SportsSelectionController(),
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
                  padding: EdgeInsets.all(20.w), // 20 padding as requested
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with Back Button and Step Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Button
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
                          // Step Indicator
                          Text(
                            "STEP 1 OF 4",
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
                        "Select Sports",
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
                        "Which sports do you play? Pick all that apply.",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      
                      // White Container for Sports Grid
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        child: GridView.builder(
                          padding: EdgeInsets.all(20.r),
                          shrinkWrap: true, // Allow the grid to take only needed space
                          physics: const NeverScrollableScrollPhysics(), // Scroll handled by SingleChildScrollView
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12.w,
                            mainAxisSpacing: 12.h,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: controller.sportsList.length,
                          itemBuilder: (context, index) {
                            final sport = controller.sportsList[index];
                            final name = sport['name']!;
                            final icon = sport['icon']!;
                            
                            return Obx(() {
                              final isSelected = controller.isSelected(name);
                              return GestureDetector(
                                onTap: () => controller.toggleSport(name),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected 
                                        ? const Color(0xFF0F172A) 
                                        : const Color(0xFFF8FAFC),
                                    borderRadius: BorderRadius.circular(24.r),
                                    border: Border.all(
                                      color: isSelected 
                                          ? const Color(0xFF0F172A) 
                                          : const Color(0xFFF1F5F9),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        icon,
                                        style: TextStyle(fontSize: 24.sp),
                                      ),
                                      SizedBox(height: 8.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                                        child: Text(
                                          name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: isSelected 
                                                ? Colors.white 
                                                : const Color(0xFF64748B),
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                      
                      SizedBox(height: 24.h),
                      
                      // Selection Counter Banner
                      Obx(() => controller.selectedSports.isNotEmpty
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                              margin: EdgeInsets.only(bottom: 20.h),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0F1E3A).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: Colors.white.withOpacity(0.1)),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.info_outline_rounded, color: Colors.white.withOpacity(0.6), size: 18.sp),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        text: "You picked ",
                                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13.sp),
                                        children: [
                                          TextSpan(
                                            text: "${controller.selectedSports.length} sports",
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                          const TextSpan(text: " — we'll personalize your experience across all of them."),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink()),
                      
                      // Bottom Buttons
                      Row(
                        children: [
                          // BACK Button
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 60.h,
                              child: OutlinedButton(
                                onPressed: () => Get.back(),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.white.withOpacity(0.1)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  backgroundColor: const Color(0xFF0F1E3A).withOpacity(0.4),
                                ),
                                child: Text(
                                  "BACK",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          // NEXT Button
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 60.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(AppRoute.identity);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF0F172A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "NEXT",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Icon(Icons.arrow_forward_rounded, size: 20.sp),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h), // Extra padding at the very bottom
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
