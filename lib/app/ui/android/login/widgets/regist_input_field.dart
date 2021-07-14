import 'package:flutter/material.dart';

class RegistInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final ValueChanged<String> validator;
  final bool isObscure;
  const RegistInputField({
    this.controller,
    this.labelText,
    this.validator,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      validator: validator,
    );
  }
}
