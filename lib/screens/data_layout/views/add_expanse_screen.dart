import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:money_tracker/core/utils/images.dart';
import 'package:money_tracker/core/components/app_bar.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/custom_text_form_field.dart';
import 'package:money_tracker/screens/data_layout/widgets/add_expense_menus_widget.dart';

class AddExpanseScreen extends StatelessWidget {
  const AddExpanseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    final padding = height * 0.01;

    return Scaffold(
      appBar: CustomAppBar(title: English.addExpanse),
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
                const MenusWidget(),
                SizedBox(height: padding),
                CustomTextFormField(
                  //validator: _nameValidator,
                  hintText: English.money.tr,
                  //textEditingController: controller.nameController,
                ),
                SizedBox(height: padding),
                CustomTextFormField(
                  maxLines: null,
                  //validator: _descriptionValidator,
                  hintText: English.description.tr,
                  //textEditingController: controller.descriptionController,
                ),
              ],
            ),
          ),
          SizedBox(height: padding),
          CustomButton(
            onPressed: () {},
            text: English.addExpanse,
            width: context.width * 0.5,
            height: context.height * 0.06,
          ),
        ],
      ),
    );
  }
}
