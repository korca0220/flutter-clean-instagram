import 'package:flutter_clean_instagram/app/controller/auth_controller.dart';
import 'package:flutter_clean_instagram/app/controller/detail/image_controller.dart';
import 'package:flutter_clean_instagram/app/controller/user_controller.dart';
import 'package:flutter_clean_instagram/app/data/provider/auth_api.dart';
import 'package:flutter_clean_instagram/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(repository: AuthRepository(clientApi: AuthAPi())),
      permanent: true,
    );
    Get.put<UserController>(UserController());
    Get.put<ImageController>(ImageController());
  }
}
