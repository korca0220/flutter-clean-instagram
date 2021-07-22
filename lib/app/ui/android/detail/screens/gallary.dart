import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/data/model/file_model.dart';
import 'package:storage_path/storage_path.dart';

class Gallary extends StatefulWidget {
  @override
  _GallaryState createState() => _GallaryState();
}

class _GallaryState extends State<Gallary> {
  List<FileModel> files;
  FileModel selectedModel;
  String image;

  @override
  void initState() {
    super.initState();
    getImagePath();
  }

  getImagePath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (files.length > 0 && files != null) {
      setState(() {
        selectedModel = files[0];
        image = files[0].files[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.clear),
                      SizedBox(width: 10),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<FileModel>(
                          dropdownColor: Colors.white,
                          items: getItems(),
                          onChanged: (FileModel d) {
                            assert(d.files.length > 0);
                            setState(() {
                              selectedModel = d;
                              image = d.files[0];
                            });
                          },
                          value: selectedModel,
                        ),
                      ),
                      Text('갤러리'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Divider(),
              Container(
                height: size.height * 0.45,
                child: image != null
                    ? Image.file(
                        File(image),
                        height: size.height * 0.45,
                        width: size.width,
                      )
                    : Container(),
              ),
              Divider(),
              selectedModel == null && selectedModel.files.length < 1
                  ? Container()
                  : Container(
                      height: size.height * 0.30,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                        ),
                        itemBuilder: (_, index) {
                          var file = selectedModel.files[index];
                          return GestureDetector(
                            child: Image.file(File(file)),
                            onTap: () {
                              setState(() {
                                image = file;
                              });
                            },
                          );
                        },
                        itemCount: selectedModel.files.length,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem> getItems() {
    return files
            .map(
              (e) => DropdownMenuItem(
                child: Text(e.folder),
                value: e,
              ),
            )
            .toList() ??
        [];
  }
}
