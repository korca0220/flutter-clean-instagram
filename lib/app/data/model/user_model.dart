import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String photoURL;
  int postCount;
  int follow;
  int following;

  UserModel({
    this.id,
    this.name,
    this.email = "",
    this.photoURL = "",
    this.postCount = 0,
    this.follow = 0,
    this.following = 0,
  });

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    photoURL = documentSnapshot["photoURL"];
    postCount = documentSnapshot["postCount"];
    follow = documentSnapshot["follow"];
    following = documentSnapshot["following"];
  }
}
