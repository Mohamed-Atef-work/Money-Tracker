import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/core/utils/images.dart';
import 'package:money_tracker/core/components/app_bar.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/custom_text_form_field.dart';
import 'package:money_tracker/screens/data_layout/controllers/add_expanse_controller.dart';

class AddExpanseScreen extends StatelessWidget {
  const AddExpanseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    return Scaffold(
      appBar: CustomAppBar(title: English.addNewExpanse),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: [
          Form(
            key: GlobalKey<FormState>(),
            child: Column(
              children: [
                SvgPicture.asset(
                  Images.expanse,
                  width: width * 0.8,
                  height: height * 0.3,
                ),
                MenusWidget(),
                SizedBox(height: height * 0.01),
                CustomTextFormField(
                  fontSize: 18,
                  //validator: _nameValidator,
                  hintText: English.money.tr,
                  //textEditingController: controller.nameController,
                ),
                SizedBox(height: height * 0.01),
                CustomTextFormField(
                  fontSize: 18,
                  maxLines: null,
                  //validator: _descriptionValidator,
                  hintText: English.description.tr,
                  //textEditingController: controller.descriptionController,
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
          CustomButton(
            onPressed: () {},
            width: context.width * 0.5,
            text: English.addNewExpanse,
            height: context.height * 0.06,
          ),
        ],
      ),
    );
  }
}

class MenusWidget extends StatelessWidget {
  const MenusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddExpanseController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropDownMenuComponent(
            items: controller.persons,
            selectedValue: controller.selectedPerson,
            onChanged: (int? selected) => controller.selectPerson(selected!),
          ),
          DropDownMenuComponent(
            items: controller.sides,
            selectedValue: controller.selectedSide,
            onChanged: (int? selected) => controller.selectSide(selected!),
          ),
          DropDownMenuComponent(
            items: controller.months,
            selectedValue: controller.selectedMonth,
            onChanged: (int? selected) => controller.selectMonth(selected!),
          ),
        ],
      ),
    );
  }
}
