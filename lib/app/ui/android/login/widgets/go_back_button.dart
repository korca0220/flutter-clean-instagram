import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/login_page/login_page_controller.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_text_theme.dart';
import 'package:get/get.dart';

class GoBackButton extends GetWidget<LoginPageController> {
  final int _initalIndex = 0;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        controller.pageController.animateToPage(_initalIndex,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      child: Text(
        'Go Back',
        style: textButtonStyle,
      ),
    );
  }
}
