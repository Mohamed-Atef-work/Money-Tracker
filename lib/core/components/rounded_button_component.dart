import 'package:flutter/material.dart';
import 'custom_text.dart';

class RoundedButtonComponent extends StatelessWidget {
  final void Function() onTap;
  final Color backgroundColor;
  final Color iconAndTextColor;
  final String text;

  const RoundedButtonComponent({
    super.key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.iconAndTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(
          text: text,
          fontSize: 18,
          textColor: iconAndTextColor,
        ),
      ),
    );
  }
}
