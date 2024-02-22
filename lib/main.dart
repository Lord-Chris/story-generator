import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/shared/_shared.dart';
import 'ui/views/image_selector_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return MaterialApp(
          title: AppConstants.appName,
          theme: AppTheme.theme,
          home: const ImageSelectorView(),
        );
      },
    );
  }
}

/// A field to put in query
/// An image selector
/// A space to show response.
/// 