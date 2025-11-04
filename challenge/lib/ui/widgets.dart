import 'package:flutter/material.dart';
import 'colors.dart';
import 'styles.dart';

Widget appCard({required String title, required List<Widget> children}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.title),
        const SizedBox(height: 12),
        for (var widget in children) ...[
          widget,
          const SizedBox(height: 12),
        ]
      ],
    ),
  );
}

Widget appRowField(String label, Widget field) {
  return Row(
    children: [
      Expanded(flex: 2, child: Text(label, style: AppStyles.label)),
      Expanded(flex: 3, child: field),
    ],
  );
}

Widget appInput({TextEditingController? controller, bool enabled = true}) {
  return Container(
    height: 44,
    decoration: BoxDecoration(
      color: enabled ? AppColors.input : Colors.grey.shade700,
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextField(
      controller: controller,
      enabled: enabled,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: InputBorder.none,
      ),
    ),
  );
}

Widget appDropdown(
  List<String> items, {
  String? value,
  Function(String?)? onChanged,
}) {
  return Container(
    height: 44,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: AppColors.dropdown,
      borderRadius: BorderRadius.circular(8),
    ),
    child: DropdownButtonFormField<String>(
      value: value,
      dropdownColor: AppColors.dropdown,
      style: const TextStyle(color: Colors.white),
      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
      decoration: const InputDecoration(border: InputBorder.none),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    ),
  );
}