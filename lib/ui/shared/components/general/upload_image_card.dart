import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../_shared.dart';

class UploadImageCard extends StatelessWidget {
  final VoidCallback onTap;
  const UploadImageCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: REdgeInsets.fromLTRB(24, 16, 24, 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.bidPry500, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.image, color: AppColors.bidPry500),
            Spacing.vertRegular(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Click to upload',
                    style: AppTextStyles.semiBold14.copyWith(
                      color: AppColors.bidPry800,
                    ),
                  ),
                ],
              ),
            ),
            Spacing.vertTiny(),
            Text(
              'PNG, JPG or JPEG',
              style: AppTextStyles.regular12.copyWith(
                color: AppColors.gray600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
