import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ExtraTiny space = 2
///
/// Tiny space = 4
///
/// Small space = 8
///
/// Regular space = 16
///
/// Medium space = 24
///
/// ExtraMedium space = 32
///
/// Large space = 48
///
/// ExtraLarge space = 72
///
/// ExtraExtraLarge space = 96
class Spacing extends StatelessWidget {
  final double height;
  final double width;

  const Spacing({
    Key? key,
    this.height = 0,
    this.width = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }

  /// Empty
  factory Spacing.empty() => const Spacing();

  // Horizontal Spacing
  /// Spacing = 2
  factory Spacing.horizExtraTiny() => Spacing(width: 2.w);

  /// Spacing = 4
  factory Spacing.horizTiny() => Spacing(width: 4.w);

  /// Spacing = 8
  factory Spacing.horizSmall() => Spacing(width: 8.w);

  /// Spacing = 16
  factory Spacing.horizRegular() => Spacing(width: 16.w);

  /// Spacing = 24
  factory Spacing.horizMedium() => Spacing(width: 24.w);

  /// Spacing = 32
  factory Spacing.horizExtraMedium() => Spacing(width: 32.w);

  /// Spacing = 48
  factory Spacing.horizLarge() => Spacing(width: 48.w);

  /// Spacing = 72
  factory Spacing.horizExtraLarge() => Spacing(width: 72.w);

  /// Spacing = 96
  factory Spacing.horizExtraExtraLarge() => Spacing(width: 96.w);

  // Vertical Spacing
  /// Spacing = 2
  factory Spacing.vertExtraTiny() => Spacing(height: 2.h);

  /// Spacing = 4
  factory Spacing.vertTiny() => Spacing(height: 4.h);

  /// Spacing = 8
  factory Spacing.vertSmall() => Spacing(height: 8.h);

  /// Spacing = 16
  factory Spacing.vertRegular() => Spacing(height: 16.h);

  /// Spacing = 24
  factory Spacing.vertMedium() => Spacing(height: 24.h);

  /// Spacing = 32
  factory Spacing.vertExtraMedium() => Spacing(height: 32.h);

  /// Spacing = 48
  factory Spacing.vertLarge() => Spacing(height: 48.h);

  /// Spacing = 72
  factory Spacing.vertExtraLarge() => Spacing(height: 72.h);

  /// Spacing = 96
  factory Spacing.vertExtraExtraLarge() => Spacing(height: 96.h);
}
