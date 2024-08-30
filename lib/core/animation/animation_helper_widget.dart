import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

class AnimationHelperWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  final Widget? child;

  const AnimationHelperWidget({
    super.key,
    this.child,
    required this.width,
    required this.height,
    this.color = kWhiteGray,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(),
      height: height,
      width: width,
      child: child,
    );
  }

  _decoration() => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      );
}
