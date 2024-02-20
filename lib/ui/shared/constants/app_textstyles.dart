import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static const ibmPlexSans = 'IBM_Plex_Sans';

  static TextStyle dynamic(
    double size, {
    Color? color,
    FontWeight? weight,
    double? height,
    double? spacing,
    FontStyle? style,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? ibmPlexSans,
      fontSize: size.spMin,
      color: color,
      fontWeight: weight,
      height: height == null ? null : height / size,
      letterSpacing: spacing,
      fontStyle: style,
    );
  }

  // // Regular
  // /// Default color - Lightcolor2
  // static final regular11 = TextStyle(
  //   fontSize: 11.spMin,
  //   fontWeight: FontWeight.normal,
  //   height: 1.3,
  //   color: AppColors.lightColor2,
  // );

  ///
  static final regular12 = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.normal,
    height: 1.2,
  );

  // static final regular13 = TextStyle(
  //   fontSize: 13.spMin,
  //   fontWeight: FontWeight.normal,
  //   height: 1.3,
  // );

  static final regular14 = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static final regular16 = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.normal,
  );

  static final regular18 = TextStyle(
    fontSize: 18.spMin,
    fontWeight: FontWeight.normal,
  );

  static final regular24 = TextStyle(
    fontSize: 24.spMin,
    fontWeight: FontWeight.normal,
    height: 1.2,
  );

  // // Medium
  static final medium12 = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  // static final medium13 = TextStyle(
  //   fontSize: 13.spMin,
  //   fontWeight: FontWeight.w500,
  //   height: 1.3,
  // );

  static final medium14 = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static final medium16 = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static final medium18 = TextStyle(
    fontSize: 18.spMin,
    fontWeight: FontWeight.w500,
    height: 1.56,
  );

  static final medium20 = TextStyle(
    fontSize: 20.spMin,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static final medium24 = TextStyle(
    fontSize: 24.spMin,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  // /// Default color - DarkColor1
  // static final medium26 = TextStyle(
  //   fontSize: 26.spMin,
  //   fontWeight: FontWeight.w500,
  //   color: AppColors.darkColor1,
  // );

  static final medium36 = TextStyle(
    fontSize: 36.spMin,
    fontWeight: FontWeight.w500,
  );

  static final medium48 = TextStyle(
    fontSize: 48.spMin,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );

  /// SemiBold
  static final semiBold12 = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.w600,
  );

  static final semiBold14 = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.w600,
  );

  static final semiBold16 = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.w600,
  );

  static final semiBold18 = TextStyle(
    fontSize: 18.spMin,
    fontWeight: FontWeight.w600,
  );

  static final semiBold24 = TextStyle(
    fontSize: 24.spMin,
    fontWeight: FontWeight.w600,
  );

  static final semiBold30 = TextStyle(
    fontSize: 30.spMin,
    fontWeight: FontWeight.w600,
  );
  // // Bold
  static final bold14 = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.bold,
  );

  // static final bold16 = TextStyle(
  //   fontSize: 16.spMin,
  //   fontWeight: FontWeight.bold,
  // );

  // // Default Color -
  // static final bold18 = TextStyle(
  //   fontSize: 18.spMin,
  //   fontWeight: FontWeight.bold,
  // );

  // static final bold28 = TextStyle(
  //   fontSize: 28.spMin,
  //   fontWeight: FontWeight.bold,
  // );
}
