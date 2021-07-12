import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/auth_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 60,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
