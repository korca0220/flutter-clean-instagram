import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistFormController extends GetxController
    with SingleGetTickerProviderMixin {
  TextEditingController emailController;
  TextEditingController displayNameController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    displayNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    displayNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
