import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension DelayedUpdate on GetxController {
  Future<void> delayedUpdate() async => await Future.delayed(
        kDurationHalfSecond,
        () => update(),
      );
}
