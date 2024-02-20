import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;
  final double spacing;
  final Widget Function(bool) child;

  const CarouselIndicator({
    Key? key,
    required this.length,
    required this.currentIndex,
    required this.spacing,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        length,
        (index) => Padding(
          padding: EdgeInsets.only(right: index != length - 1 ? spacing : 0),
          child: child(currentIndex == index),
        ),
      ),
    );
  }
}
