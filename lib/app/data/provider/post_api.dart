import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clean_instagram/app/data/model/post_model.dart';

class PostApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getMyPosts(String uid) async {
    return await _firestore.collection("users/$uid/posts").get().then((value) {
      List<PostModel> retVal = [];
      value.docs.forEach((element) {
        retVal.add(PostModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });

    //   .map((QuerySnapshot query) {
    // print(query);
    // List<PostModel> retVal;
    // query.docs.forEach((element) {
    //   retVal.add(PostModel.fromDocumentSnapshot(element));
    // });
    // return retVal;
  }
}
