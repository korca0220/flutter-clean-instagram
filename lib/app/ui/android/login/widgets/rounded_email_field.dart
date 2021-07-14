import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/text_field_container.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/validations.dart';

class RoundedEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  RoundedEmailField({
    this.controller,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Align(
        alignment: Alignment.topCenter,
        child: TextFormField(
          controller: controller,
          maxLines: 1,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.grey,
              size: 25,
            ),
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 15,
            ),
            border: InputBorder.none,
            errorStyle: TextStyle(height: 0.1),
          ),
          validator: Validations.validateEmail,
          onChanged: onChanged,
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
