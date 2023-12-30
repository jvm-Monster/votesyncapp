import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/max_width_box.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_scaled_box.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

class ResponsiveScaleWidget extends StatelessWidget {
  final Widget screenToScaleWidget;
  const ResponsiveScaleWidget({super.key,required this.screenToScaleWidget});

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 1500,
      background: Container(color: Colors.white,),
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(context, conditionalValues: [
          Condition.equals(name: MOBILE, value: 555),
          Condition.between(start: 900, end: 1200, value: 900),
          Condition.between(start: 2000, end: 1300, value: 2000),
          // There are no conditions for width over 1200
          // because the `maxWidth` is set to 1200 via the MaxWidthBox.
        ]).value,
        child: BouncingScrollWrapper.builder(
            context, screenToScaleWidget,
            dragWithMouse: true),
      ),
    );
  }
}
