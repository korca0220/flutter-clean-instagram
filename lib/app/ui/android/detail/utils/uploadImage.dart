import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadImage {
  static Future uploadImage(String inputSource) async {
    final picker = ImagePicker();
    List<XFile> pickedImageList;
    XFile pickedImage;
    List<Map<String, dynamic>> resultImageList = [];
    try {
      if (inputSource == 'gallary') {
        pickedImageList = await picker.pickMultiImage(
          maxWidth: 1920,
        );
        pickedImageList.forEach((element) {
          resultImageList.add({
            "fileName": element.path,
            "imageFile": File(
              element.path,
            ),
          });
        });
        return resultImageList;
      } else if (inputSource == 'camera') {
        pickedImage = await picker.pickImage(source: ImageSource.camera);
        resultImageList.add({
          "fileName": pickedImage.path,
          "imageFile": File(pickedImage.path)
        });
      } else if (inputSource == 'video') {
        pickedImage = await picker.pickVideo(source: ImageSource.camera);
        resultImageList.add({
          "fileName": pickedImage.path,
          "imageFile": File(pickedImage.path)
        });
      }

      return resultImageList;
    } catch (err) {
      print(err);
    }
  }
}
