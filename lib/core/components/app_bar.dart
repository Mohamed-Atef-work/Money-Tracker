import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? height;
  final Widget? leading;
  final double? titleSize;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.height,
    this.leading,
    this.actions,
    this.titleSize,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      actions: actions,
      leading: leading,
      centerTitle: true,
      toolbarHeight: height ?? 50,
      backgroundColor: kPrimaryColorYellow,
      title: CustomText(
        text: title,
        //fontFamily: kPacifico,
        textColor: Colors.black,
        fontSize: titleSize ?? 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

PreferredSizeWidget appBar({
  double? height,
  Widget? leading,
  double? titleSize,
  List<Widget>? actions,
  required String title,
}) =>
    AppBar(
      elevation: 0.0,
      actions: actions,
      leading: leading,
      centerTitle: true,
      toolbarHeight: height ?? 50,
      backgroundColor: kPrimaryColorYellow,
      title: CustomText(
        text: title,
        //fontFamily: kPacifico,
        textColor: Colors.black,
        fontSize: titleSize ?? 30,
        fontWeight: FontWeight.bold,
      ),
    );
