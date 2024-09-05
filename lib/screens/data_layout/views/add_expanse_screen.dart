import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_tracker/core/utils/images.dart';
import 'package:money_tracker/core/components/app_bar.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/components/custom_text_form_field.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/data_layout/widgets/add_expense_menus_widget.dart';
import 'package:money_tracker/screens/data_layout/controllers/add_expanse_controller.dart';
import 'package:money_tracker/screens/data_layout/widgets/add_person_or_side_widget.dart';

class AddExpanseScreen extends StatelessWidget {
  const AddExpanseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    final padding = height * 0.01;
    final addController = Get.find<AddExpanseController>();
    final personsSidesController = Get.find<PersonsSidesDataController>();
    return Scaffold(
      appBar: CustomAppBar(title: English.addExpanse),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: [
          SvgPicture.asset(
            Images.expanse,
            width: width * 0.8,
            height: height * 0.3,
          ),
          const MenusWidget(),
          SizedBox(height: padding),
          Form(
            key: addController.formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: English.money.tr,
                  textEditingController: addController.moneyCon,
                ),
                SizedBox(height: padding),
                CustomTextFormField(
                  maxLines: null,
                  hintText: English.description.tr,
                  textEditingController: addController.descriptionCon,
                ),
              ],
            ),
          ),
          SizedBox(height: padding),
          GetBuilder<AddExpanseController>(
            builder: (controller) => CustomButton(
              width: context.width * 0.5,
              text: English.addExpanse.tr,
              height: context.height * 0.06,
              onPressed: () => controller.addExpanses(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                textColor: Colors.black,
                backgroundColor: kWhiteGray,
                text: English.addPerson.tr,
                onPressed: () => personsSidesController.showPersonSheet(),
              ),
              CustomButton(
                textColor: Colors.black,
                backgroundColor: kWhiteGray,
                text: English.addSpendingSide.tr,
                onPressed: () =>personsSidesController.showSpendingSideSheet(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
