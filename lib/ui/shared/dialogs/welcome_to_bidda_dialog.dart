import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../_shared.dart';

class WelcomeToBiddaDialog extends StatelessWidget {
  const WelcomeToBiddaDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: REdgeInsets.symmetric(horizontal: 24, vertical: 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.gray100,
                ),
                child: Image.asset(AppImgAssets.biddaWelcome),
              ),
              Spacing.vertRegular(),
              Text(
                'Welcome to Bidda',
                style: AppTextStyles.semiBold18.copyWith(
                  color: AppColors.gray900,
                ),
              ),
              Spacing.vertTiny(),
              Text(
                'We’re glad to have you onboard. Here are some quick tips to get you up and running.',
                textAlign: TextAlign.center,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.gray600,
                ),
              ),
              Spacing.vertLarge(),
              AppButton(
                label: 'Next',
                onPressed: Navigator.of(context).pop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
