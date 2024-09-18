import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? obSecure;
  final int? maxLines;
  final String hintText;
  final double? fontSize;
  final Color? fillColor;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? hintTextColor;
  final void Function()? suffixPressed;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;

  const CustomTextFormField({
    super.key,
    this.maxLines,
    this.validator,
    this.onChanged,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.hintTextColor,
    this.fontSize = 18,
    this.obSecure = false,
    required this.hintText,
    this.textEditingController,
    this.fillColor = kWhiteGray,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: validator,
      obscureText: obSecure!,
      controller: textEditingController,
      decoration: _inputDecoration(),
    );
  }

  _border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white),
      );

  _inputDecoration() => InputDecoration(
        filled: true,
        border: _border(),
        hintText: hintText,
        labelText: labelText,
        fillColor: fillColor,
        enabledBorder: _border(),
        focusedBorder: _border(),
        hintStyle: TextStyle(color: hintTextColor, fontSize: fontSize),
        prefixIcon: Icon(prefixIcon, color: kPrimaryColorYellow),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon)),
        ),
      );
}

