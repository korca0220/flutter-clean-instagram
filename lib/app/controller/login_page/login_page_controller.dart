import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController
    with SingleGetTickerProviderMixin {
  PageController controller;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    controller = PageController(initialPage: 0, keepPage: false);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
