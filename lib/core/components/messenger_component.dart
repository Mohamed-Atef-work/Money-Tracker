import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_tracker/core/components/custom_text.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/images.dart';

class MessengerComponent extends StatelessWidget {
  final String mess;
  final double? imageWidth;
  final double? imageHeight;
  const MessengerComponent(
    this.mess, {
    super.key,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Images.message,
            width: imageWidth ?? context.width * 0.4,
            height: imageHeight ?? context.height * 0.3,
          ),
          SizedBox(height: context.height * 0.01),
          CustomText(
            text: mess,
            fontSize: 25,
            //fontFamily: kPacifico,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
