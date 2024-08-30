import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';

class BaseModelSheetComponent extends StatelessWidget {
  final Widget child;
  const BaseModelSheetComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: _decoration(),
      child: Column(
        children: [
          Container(
            width: 30,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  _decoration() => BoxDecoration(
        color: kPrimaryColorYellow,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        border: Border.all(color: kWhite, style: BorderStyle.solid),
      );
}
