import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/_constants.dart';

class AppLoader extends StatelessWidget {
  final Color? color;
  final double? padding;
  final double? size;
  const AppLoader({
    Key? key,
    this.color = AppColors.white,
    this.padding,
    this.size = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding ?? 5.r),
        child: SizedBox(
          height: size,
          width: size,
          child: Platform.isAndroid
              ? CircularProgressIndicator(
                  color: color,
                )
              : CupertinoActivityIndicator(color: color, radius: 13),
        ),
      ),
    );
  }
}
