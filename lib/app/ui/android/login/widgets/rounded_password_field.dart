import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.grey,
            size: 20,
          ),
          hintText: "Your Password",
          hintStyle: TextStyle(
            fontSize: 14,
          ),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.grey,
            size: 20,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
