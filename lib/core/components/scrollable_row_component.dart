import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/custom_text.dart';

class ScrollableRowItemComponent extends StatelessWidget {
  final void Function() onTap;
  final Color backgroundColor;
  final Color iconAndTextColor;
  final String title;

  const ScrollableRowItemComponent({
    super.key,
    required this.onTap,
    required this.title,
    required this.backgroundColor,
    required this.iconAndTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              fontSize: 18,
              textColor: iconAndTextColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
