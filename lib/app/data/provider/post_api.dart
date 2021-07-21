import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_clean_instagram/app/data/model/post_model.dart';

class PostApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _fireStorage = FirebaseStorage.instance;

  getMyPosts(String uid) async {
    return await _firestore.collection("users/$uid/posts").get().then((value) {
      List<PostModel> retVal = [];
      value.docs.forEach((element) {
        retVal.add(PostModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  uploadImage(String fileName, var imageFile) async {
    try {
      final snapshot = await _fireStorage.ref(fileName).putFile(imageFile);
      final fileUrl = await snapshot.ref.getDownloadURL();
      if (fileUrl.isNotEmpty) {
        return fileUrl;
      }
    } on FirebaseException catch (error) {
      print(error);
      return null;
    }
  }
}
