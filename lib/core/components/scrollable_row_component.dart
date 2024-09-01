import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/custom_text.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

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
        child: AnimatedContainer(
          padding: kHorizontal10Vertical5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isChosen ? Colors.black : Colors.green,
          ),
          duration: kDuration1Second,
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

class ScrollableRowComponent extends StatelessWidget {
  final int comingIndex;
  final List<String> titles;
  final void Function(int index) onTap;

  const ScrollableRowComponent({
    super.key,
    required this.onTap,
    required this.titles,
    required this.comingIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.05,
      child: ListView.builder(
        itemCount: titles.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => ScrollableRowItemComponent(
          title: titles[index],
          onTap: () => onTap(index),
          isChosen: comingIndex == index ? true : false,
        ),
      ),
    );
  }
}
