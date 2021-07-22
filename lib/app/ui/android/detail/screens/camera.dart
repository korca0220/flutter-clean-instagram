import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/data/model/file_model.dart';
import 'package:storage_path/storage_path.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<FileModel> files;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Row(
                  children: [Icon(Icons.clear)],
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
