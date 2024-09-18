import 'package:money_tracker/screens/repositories/models/expanse_model.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/components/custom_text.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:money_tracker/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpenseComponent extends StatelessWidget {
  final ExpanseModel model;

  const ExpenseComponent(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    return Card(
      color: kWhiteGray,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SvgPicture.asset(
              Images.expanse,
              width: width * 0.15,
              height: height * 0.1,
            ),
            const SizedBox(width: 8),
            Column(
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
            const SizedBox(width: 10),
            Expanded(
              child: CustomText(
                textColor: Colors.black,
                text: model.description,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansesListViewWidget extends StatelessWidget {
  final List expanses;
  const ExpansesListViewWidget(this.expanses, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: expanses.length,
        separatorBuilder: (_, __) => const SizedBox(height: 5),
        itemBuilder: (_, index) => ExpenseComponent(expanses[index]),
      ),
    );
  }
}
