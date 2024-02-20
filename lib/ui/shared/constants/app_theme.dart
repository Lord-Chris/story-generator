import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '_constants.dart';

class AppTheme {
  static final theme = ThemeData(
      primarySwatch: Colors.indigo,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.bidPry400),
      fontFamily: AppTextStyles.ibmPlexSans,
      scaffoldBackgroundColor: AppColors.white,
      useMaterial3: true,
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(size: 17.sp),
        surfaceTintColor: AppColors.transparent,
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        tilePadding: EdgeInsets.symmetric(vertical: 4),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.gray50,
      )
      // radioTheme: RadioThemeData(
      //   fillColor: MaterialStateProperty.resolveWith(
      //     (states) => states.isEmpty ? AppColors.lightColor3 : null,
      //   ),
      // ),
      // checkboxTheme: CheckboxThemeData(
      //   fillColor: MaterialStateProperty.resolveWith(
      //     (states) => states.isEmpty ? AppColors.lightColor3 : null,
      //   ),
      // ),
      );
}
