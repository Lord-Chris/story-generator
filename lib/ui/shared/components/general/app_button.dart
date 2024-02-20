import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/_constants.dart';
import '../_components.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color labelColor, buttonColor;
  final Color? borderColor, disabledColor;
  final double? width, height, borderRadius, labelSize, elevation;
  final bool isCollapsed, isDisabled;
  final bool hasBorder, isBusy, showFeedback;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final Widget? customChild, prefixWidget, suffixWidget;

  const AppButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    this.customChild,
    this.buttonColor = AppColors.bidPry500,
    this.labelColor = AppColors.white,
    this.disabledColor,
    this.borderColor,
    this.isCollapsed = false,
    this.isBusy = false,
    this.isDisabled = false,
    this.showFeedback = true,
    this.elevation = 0,
    this.fontWeight,
    this.borderRadius,
    this.padding,
    this.labelSize,
    this.prefixWidget,
    this.suffixWidget,
  })  : hasBorder = false,
        super(key: key);

  const AppButton.outline({
    Key? key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    this.customChild,
    this.buttonColor = AppColors.white,
    this.labelColor = AppColors.bidPry500,
    this.disabledColor,
    this.borderColor = AppColors.bidPry500,
    this.isCollapsed = false,
    this.isBusy = false,
    this.isDisabled = false,
    this.showFeedback = true,
    this.elevation = 0,
    this.fontWeight,
    this.borderRadius,
    this.padding,
    this.labelSize,
    this.prefixWidget,
    this.suffixWidget,
  })  : hasBorder = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? (isCollapsed ? null : double.maxFinite),
      height: height ?? (isCollapsed ? null : 48.h),
      child: MaterialButton(
        onPressed: isDisabled ? null : () => isBusy ? null : onPressed?.call(),
        disabledColor: disabledColor ?? buttonColor.withOpacity(0.3),
        color: buttonColor,
        elevation: elevation,
        clipBehavior: Clip.hardEdge,
        splashColor: showFeedback ? null : buttonColor,
        highlightColor: showFeedback ? null : buttonColor,
        highlightElevation: showFeedback ? 4 : 0,
        padding: padding ?? EdgeInsets.all(10.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 8.r),
          side: hasBorder
              ? BorderSide(
                  color: borderColor!.withOpacity(isDisabled ? 0.3 : 1),
                  width: 1.r,
                )
              : BorderSide.none,
        ),
        child: Builder(
          builder: (context) {
            if (isBusy) {
              return SizedBox.square(
                child: FittedBox(
                  child: AppLoader(
                    padding: 10,
                    color: labelColor,
                  ),
                ),
              );
            }

            if (customChild != null) return customChild!;

            return FittedBox(
              child: Row(
                children: [
                  if (prefixWidget != null)
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: prefixWidget,
                    ),
                  Center(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.semiBold16.copyWith(
                        fontSize: labelSize?.spMin,
                        fontWeight: fontWeight,
                        color: labelColor,
                      ),
                    ),
                  ),
                  if (suffixWidget != null)
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: suffixWidget,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  final Alignment? alignment;
  final VoidCallback? onPressed;
  const AppBackButton({
    Key? key,
    this.alignment,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      alignment: alignment ?? Alignment.centerLeft,
      onPressed: onPressed ?? Navigator.of(context).pop,
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 14.r,
      ),
    );
  }
}
