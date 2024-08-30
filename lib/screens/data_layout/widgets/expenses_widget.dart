import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/components/custom_text.dart';
import 'package:money_tracker/screens/data_layout/model.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:money_tracker/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpensesWidget extends StatelessWidget {
  final ExpanseModel model;
  const ExpensesWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    return Card(
      child: Row(
        children: [
          Padding(
            padding: kHorizontalPadding5,
            child: SvgPicture.asset(
              Images.expanse,
              width: width * 0.15,
              height: height * 0.1,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                fontSize: 18,
                textColor: kDarkBrown,
                fontWeight: FontWeight.bold,
                text: model.money.toString(),
              ),
              SizedBox(height: height * 0.01),
              CustomText(
                fontSize: 15,
                text: model.person,
                textColor: kDarkBrown,
              ),
              SizedBox(height: height * 0.005),
              CustomText(
                fontSize: 15,
                textColor: Colors.black,
                text: model.spendingSide,
              ),
            ],
          ),
          SizedBox(width: width * 0.1),
          Expanded(
            child: CustomText(
              textAlign: TextAlign.left,
              textColor: Colors.black,
              text: model.description,
            ),
          ),
        ],
      ),
    );
  }
}
