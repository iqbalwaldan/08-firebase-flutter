// Moh. Iqbal Waldan
// MI-2F
// 2031710139

import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key key,
    this.controller,
    this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      controller: controller,
    );
  }
}
