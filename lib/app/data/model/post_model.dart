import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String id;
  String content;
  int likes;
  List<dynamic> images;

  PostModel({
    this.content = "",
    this.likes = 0,
    this.images = const [],
  });

  PostModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    content = documentSnapshot["content"];
    likes = documentSnapshot["likes"];
    images = documentSnapshot["images"];
  }
}
