import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/auth_controller.dart';
import 'package:flutter_clean_instagram/app/controller/login_page/login_page_controller.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/go_back_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/rounded_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/rounded_email_field.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/rounded_password_field.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/sign_up_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/widgets/loading_indicator.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_colors.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_text_theme.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  Duration get loginTime => Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    LoginPageController pageController = Get.put(LoginPageController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: GetX<AuthController>(
        builder: (_) {
          return Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Instagram',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: PageView(
                    controller: pageController.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          SignInButton(
                            Buttons.Email,
                            onPressed: () {
                              pageController.pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                          ),
                          SignInButton(
                            Buttons.GoogleDark,
                            onPressed: () {
                              controller.googleLogin();
                            },
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    RoundedEmailField(
                                      controller: controller.emailController,
                                      hintText: "Your Email",
                                      icon: Icons.person,
                                      onChanged: (value) {},
                                    ),
                                    RoundedPasswordField(
                                      controller: controller.passwordController,
                                      onChanged: (value) {},
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              RoundedButton(
                                child: _.isLoading.value
                                    ? SizedBox(
                                        child: CircularProgressIndicator(
                                          color: containerColor,
                                        ),
                                        height: 20,
                                        width: 20,
                                      )
                                    : Text(
                                        'Login',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    controller.login(
                                      controller.emailController.text,
                                      controller.passwordController.text,
                                    );
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GoBackButton(),
                                  SignUpButton(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
