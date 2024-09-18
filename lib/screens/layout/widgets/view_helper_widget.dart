import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_text.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';

class ViewHelperWidget extends StatelessWidget {
  final Widget data;
  final Widget menu;

  final Widget statistics;
  const ViewHelperWidget({
    super.key,
    required this.data,
    required this.statistics,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kVerticalPadding10,
            child: menu,
          ),
          TabBar(
            indicatorWeight: 3,
            padding: kPadding5,
            enableFeedback: true,
            labelPadding: kPadding10,
            labelColor: Colors.black,
            indicatorColor: Colors.orange,
            unselectedLabelColor: kDarkBrown,
            physics: const BouncingScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.tab,
            automaticIndicatorColorAdjustment: false,
            splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
            tabs: [
              CustomText(
                fontSize: 18,
                text: English.data.tr,
                fontWeight: FontWeight.w700,
                // textColor: AppColors.darkBlue,
              ),
              CustomText(
                fontSize: 18,
                text: English.statistics.tr,
                fontWeight: FontWeight.w700,
                // textColor: AppColors.darkBlue,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              children: [
                data,
                statistics,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
