import 'package:flutter_clean_instagram/app/controller/auth_controller.dart';
import 'package:flutter_clean_instagram/app/data/model/post_model.dart';
import 'package:flutter_clean_instagram/app/data/provider/post_api.dart';
import 'package:flutter_clean_instagram/app/data/repository/post_repository.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  PostRepository repository = PostRepository(clientApi: PostApi());
  final _postList = [].obs;
  get postList => this._postList;
  set postList(value) => this._postList.value = value;

  @override
  void onInit() async {
    super.onInit();
    String uid = Get.find<AuthController>().user.uid;
    if (uid.isNotEmpty) {
      var getLists = await repository.getMyPosts(uid);
      if (getLists != null) {
        _postList.assignAll(getLists);
        update();
      }
    }
  }

  uploadImage(String fileName, var imageFile) {
    return repository.uploadImage(fileName, imageFile);
  }
}
