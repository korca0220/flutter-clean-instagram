import 'package:get/get.dart';

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
    update();
  }
}
