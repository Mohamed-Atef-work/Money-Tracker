import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/custom_text.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';

class ScrollableRowItemComponent extends StatelessWidget {
  final void Function() onTap;
  final bool isChosen;
  final String title;

  const ScrollableRowItemComponent({
    super.key,
    required this.onTap,
    required this.title,
    required this.isChosen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding5,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: kHorizontal10Vertical5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isChosen ? Colors.black : Colors.green,
          ),
          child: CustomText(
            text: title,
            fontSize: 18,
            textAlign: TextAlign.center,
            textColor: isChosen ? Colors.green : Colors.black,
          ),
        ),
      ),
    );
  }
}
