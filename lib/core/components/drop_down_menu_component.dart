import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';

class DropDownMenuComponent extends StatelessWidget {
  final List<String> items;
  final String selectedValue;
  final void Function(String? value) onChanged;
  const DropDownMenuComponent({
    super.key,
    required this.items,
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    final menuItems = List.generate(
      items.length,
      (index) => DropdownMenuItem(value: items[index], child: Text(items[index].tr)),
    );
    return Container(
      decoration: BoxDecoration(
        color: kDarkBrown,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        items: menuItems,
        value: selectedValue,
        onChanged: onChanged,
        focusColor: kDarkBrown,
        dropdownColor: Colors.black,
        padding: kHorizontalPadding10,
        underline: const SizedBox.shrink(),
        borderRadius: BorderRadius.circular(20),
        style: const TextStyle(color: Colors.white, fontSize: 18),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
      ),
    );
  }
}
