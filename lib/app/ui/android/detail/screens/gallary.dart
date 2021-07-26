import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/detail/image_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Gallary extends GetView<ImageController> {
  Future uploadImage(String inputSource) async {
    final picker = ImagePicker();
    List<XFile> pickedImage;
    List<Map<String, dynamic>> resultImageList = [];
    try {
      pickedImage = await picker.pickMultiImage(
        maxWidth: 1920,
      );
      pickedImage.forEach((element) {
        resultImageList.add({
          "fileName": element.path,
          "imageFile": File(
            element.path,
          ),
        });
      });
      return resultImageList;
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    uploadImage('gallary').then((value) {
      print(value);
    });
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          GetBuilder<ImageController>(
            builder: (_) {
              return Container();
            },
          )
        ],
      )),
    );
  }
}
