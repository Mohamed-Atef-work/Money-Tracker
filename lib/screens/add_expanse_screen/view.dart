import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/add_expense_menus_widget.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/utils/images.dart';
import 'package:money_tracker/core/components/app_bar.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/screens/add_expanse_screen/controller.dart';
import 'package:money_tracker/core/components/custom_text_form_field.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';

class AddExpanseScreen extends StatelessWidget {
  const AddExpanseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    final padding = height * 0.01;
    final personsSidesController = Get.find<PersonsSidesController>();
    return Scaffold(
      appBar: CustomAppBar(title: English.addExpanse),
      body: ListView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        children: [
          SvgPicture.asset(
            Images.expanse,
            width: width * 0.8,
            height: height * 0.3,
          ),
          const MenusWidget(),
          SizedBox(height: padding),
          const AddExpanseForm(),
          SizedBox(height: padding),
          GetBuilder<AddExpanseController>(
            builder: (controller) {
              if (controller.expanseState == RequestState.loading) {
                return const LoadingWidget();
              } else {
                return CustomButton(
                  width: context.width * 0.5,
                  text: English.addExpanse.tr,
                  height: context.height * 0.06,
                  onPressed: () => controller.addExpanses(),
                );
              }
            },
          ),
          SizedBox(height: padding * 2),
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
                onPressed: () => personsSidesController.showSpendingSideSheet(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddExpanseForm extends StatelessWidget {
  const AddExpanseForm({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final padding = height * 0.01;
    final addController = Get.find<AddExpanseController>();

    return Form(
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
    );
  }
}
