import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/auth_controller.dart';
import 'package:get/get.dart';

class MenuBottomSheet {
  static void menuBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.3,
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[400],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Align(
                    child: Text("설정"),
                    alignment: Alignment(-1.2, 0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Align(
                    child: Text("로그 아웃"),
                    alignment: Alignment(-1.2, 0),
                  ),
                  onTap: () {
                    Get.find<AuthController>().signOut();
                    Get.back();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
