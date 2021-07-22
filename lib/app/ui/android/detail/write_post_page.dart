import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/detail/modify_page.dart';
import 'package:flutter_clean_instagram/app/ui/android/detail/select_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WritePostPage extends GetView {
  PageController _pageController = PageController(initialPage: 0);

  uploadImage(String inputSource) async {
    final picker = ImagePicker();
    List<XFile> pickedImage;
    List<Map<String, dynamic>> resultImageList = [];
    try {
      pickedImage = await picker.pickMultiImage(
        maxWidth: 1920,
      );
      pickedImage.forEach((element) {
        resultImageList.add(
          {
            "fileName": element.path,
            "imageFile": File(
              element.path,
            )
          },
        );
        return resultImageList;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final selectedImages = uploadImage('gallary');
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            SelectPage(),
            ModifyPage(),
          ],
        ),
      ),
    );
  }
}
