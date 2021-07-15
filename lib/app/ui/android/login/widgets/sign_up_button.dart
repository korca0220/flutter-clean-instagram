import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/auth_controller.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/regist_input_field.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/validations.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_colors.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_text_theme.dart';
import 'package:get/get.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return SignupDialog();
          },
        );
      },
      child: Text('Sign Up', style: textButtonStyle),
    );
  }
}

class SignupDialog extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              right: -35.0,
              top: -35.0,
              child: InkResponse(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  radius: 16,
                ),
              ),
            ),
            Text(
              'Welcome Sign up',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: RegistInputField(
                      labelText: "Email",
                      controller: controller.emailController,
                      validator: Validations.validateEmail,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RegistInputField(
                      labelText: "DisplayName",
                      controller: controller.displayNameController,
                      validator: Validations.validateDisplayName,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RegistInputField(
                      labelText: "Password",
                      controller: controller.passwordController,
                      isObscure: true,
                      validator: Validations.validatePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RegistInputField(
                      labelText: "Confirm Password",
                      controller: controller.confirmPasswordController,
                      isObscure: true,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Confirm password is empty';
                        } else if (val != controller.passwordController.text) {
                          return 'Password not match';
                        } else
                          return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: formBoxColor,
                      ),
                      child: Text(
                        'Regist',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          controller.createUser(
                            controller.displayNameController.text,
                            controller.emailController.text,
                            controller.passwordController.text,
                          );
                          Get.back();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
