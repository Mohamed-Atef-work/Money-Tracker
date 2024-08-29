import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final double? fontSize;
  final Color? textColor;
  final String? fontFamily;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    this.overflow,
    this.maxLines,
    this.textColor,
    this.textAlign,
    this.fontFamily,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        overflow: overflow,
        fontSize: fontSize,
        color: textColor,
      ),
    );
  }
}
