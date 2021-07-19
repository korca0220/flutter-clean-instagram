import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/user_controller.dart';
import 'package:flutter_clean_instagram/app/data/model/user_model.dart';
import 'package:flutter_clean_instagram/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController({@required this.repository}) : assert(repository != null);
  TextEditingController emailController;
  TextEditingController displayNameController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  Rx<User> _firebaseUser = Rx<User>(FirebaseAuth.instance.currentUser);
  RxBool isLoading = false.obs;

  User get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    displayNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  @override
  void onClose() {
    emailController.dispose();
    displayNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void getUser() async {
    if (_auth.currentUser != null) {
      Get.find<UserController>().user =
          await repository.getUser(_auth.currentUser.uid);
    }
  }

  void createUser(String name, String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      if (_authResult != null) {
        _authResult.user.updateDisplayName(name);
      }
      UserModel _user = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: email,
      );

      isLoading.value = false;
      emailController.clear();
      displayNameController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      if (await repository.createNewUser(_user)) {
        Get.find<UserController>().user = _user;
      }
    } catch (e) {
      Get.snackbar(
        "Error creating account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      emailController.clear();
      displayNameController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      isLoading.value = false;
    }
  }

  void login(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.find<UserController>().user =
          await repository.getUser(_authResult.user.uid);
      isLoading.value = false;
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      );
      isLoading.value = false;
    }
  }

  void googleLogin() async {
    isLoading.value = true;
    try {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      isLoading.value = false;
      User _authResult = (await _auth.signInWithCredential(credential)).user;

      if (Get.find<UserController>().user.id == null) {
        UserModel _user = UserModel(
            id: _authResult.uid,
            name: _authResult.displayName,
            email: _authResult.email,
            photoURL: _authResult.photoURL);
        await repository.createNewUser(_user);
      }
      Get.find<UserController>().user =
          await repository.getUser(_authResult.uid);
    } catch (e) {
      Get.snackbar(
        "Error Google signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      if (await repository.signOut(_auth)) {
        Get.find<UserController>().clear();
      }
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
