import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_instagram/app/data/model/user_model.dart';
import 'package:flutter_clean_instagram/app/data/provider/auth_api.dart';

class AuthRepository {
  final AuthAPi clientApi;

  const AuthRepository({@required this.clientApi}) : assert(clientApi != null);

  createNewUser(UserModel user) {
    return clientApi.createNewUser(user);
  }

  getUser(String uid) {
    return clientApi.getUser(uid);
  }

  signOut(FirebaseAuth auth) {
    return clientApi.signOut(auth);
  }
}
