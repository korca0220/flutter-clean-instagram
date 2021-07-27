import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/detail/image_controller.dart';
import 'package:flutter_clean_instagram/app/ui/android/detail/utils/uploadImage.dart';
import 'package:get/get.dart';

class Gallary extends GetView<ImageController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    UploadImage.uploadImage('gallary').then((value) {
      if (value != null)
        ImageController.to.setMultiImage(value);
      else
        Get.back();
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Selected Images',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GetBuilder(
                init: ImageController(),
                builder: (_) {
                  return Container(
                    height: size.height * 0.5,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(
                        _.multipleImages.length,
                        (index) {
                          return Container(
                            child: Image.file(
                              _.multipleImages[index]["imageFile"],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
