import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/core/components/custom_text_form_field.dart';
import 'package:money_tracker/core/components/base_model_sheet_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class AddPersonOrSideWidget extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const AddPersonOrSideWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BaseModelSheetComponent(
      child: GetBuilder<PersonsSidesController>(
        builder: (controller) {
          if (controller.addPersonOrSideState == RequestState.loading) {
            return const LoadingWidget();
          } else {
            return Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: context.height * 0.01),
                    child: CustomTextFormField(
                      fontSize: 15,
                      hintText: title,
                      textEditingController: controller.sideOrPersonCon,
                    ),
                  ),
                  CustomButton(
                    text: English.add.tr,
                    onPressed: onPressed,
                    width: context.width * 0.3,
                    backgroundColor: Colors.black,
                    height: context.height * 0.06,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
