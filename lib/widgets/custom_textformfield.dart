import 'package:flutter/material.dart';

Widget customTextFormField(
    BuildContext context, String labeltext, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: labeltext,
    ),
  );
}
