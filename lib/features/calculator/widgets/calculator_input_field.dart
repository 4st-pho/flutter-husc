import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorInputField extends StatelessWidget {
  const CalculatorInputField({
    required this.textLable,
    this.controller,
    this.textInputAction,
    super.key,
  });
  final String textLable;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: textLable),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textInputAction: textInputAction,
      validator: (value) {
        if ((value ?? '').isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}
