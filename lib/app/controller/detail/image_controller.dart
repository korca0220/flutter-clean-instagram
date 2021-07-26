import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/data/model/file_model.dart';
import 'package:get/get.dart';
import 'package:storage_path/storage_path.dart';

class ImageController extends GetxController {
  static ImageController get to => Get.find();
  var _multipleImages = <Map<String, dynamic>>[].obs;

  RxList<Map<String, dynamic>> get multipleImages {
    return _multipleImages;
  }

  @override
  void onInit() {
    super.onInit();
  }

  setMultiImage(List<Map<String, dynamic>> item) {
    _multipleImages.assignAll(item);
    print(_multipleImages);
    update();
  }
}
