import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/auth_controller.dart';
import 'package:flutter_clean_instagram/app/controller/login_page/login_page_controller.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/rounded_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/rounded_input_field.dart';
import 'package:flutter_clean_instagram/app/ui/android/login/widgets/rounded_password_field.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  final int _initalIndex = 0;
  Duration get loginTime => Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    LoginPageController loginController = Get.put(LoginPageController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Center(
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
              // color: Colors.red,
              child: PageView(
                controller: loginController.controller,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Email,
                        onPressed: () {
                          loginController.controller.animateToPage(1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                      SignInButton(
                        Buttons.GoogleDark,
                        onPressed: () {
                          loginController.controller.animateToPage(2,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        children: [
                          RoundedInputField(
                            controller: loginController.emailController,
                            hintText: "Your Email",
                            icon: Icons.person,
                            onChanged: (value) {},
                          ),
                          RoundedPasswordField(
                            controller: loginController.passwordController,
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 10),
                          RoundedButton(
                            text: "Login",
                            onPressed: () {
                              controller.login(
                                loginController.emailController.text,
                                loginController.passwordController.text,
                              );
                            },
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    loginController.controller.animateToPage(
                                        _initalIndex,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                  },
                                  child: Text(
                                    'Go Back',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton(
                        child: Text('Go Back'),
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          loginController.controller.animateToPage(_initalIndex,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
