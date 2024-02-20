import 'package:flutter/material.dart';

class ScrollableColumn extends StatelessWidget {
  final List<Widget>? children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics? physics;

  const ScrollableColumn({
    Key? key,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    VerticalDirection? verticalDirection,
    EdgeInsetsGeometry? padding,
    this.children,
    this.textDirection,
    this.textBaseline,
    this.physics,
  })  : crossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment = mainAxisAlignment ?? MainAxisAlignment.start,
        verticalDirection = verticalDirection ?? VerticalDirection.down,
        padding = padding ?? EdgeInsets.zero,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[const SizedBox(width: double.infinity)];

    if (this.children != null) children.addAll(this.children!);
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          physics: physics,
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraint.maxHeight - padding.vertical,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: verticalDirection,
                textBaseline: textBaseline,
                textDirection: textDirection,
                children: children,
              ),
            ),
          ),
        );
      },
    );
  }
}
