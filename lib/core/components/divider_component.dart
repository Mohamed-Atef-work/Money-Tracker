import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/extensions.dart';

class DividerComponent extends StatelessWidget {
  const DividerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 15,
      thickness: 0.5,
      color: Colors.black,
      indent: context.width * 0.05,
      endIndent: context.width * 0.05,
    );
  }
}
