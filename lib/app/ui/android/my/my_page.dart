import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/auth_controller.dart';
import 'package:flutter_clean_instagram/app/controller/my/profile_controller.dart';
import 'package:flutter_clean_instagram/app/controller/posts_controller.dart';
import 'package:flutter_clean_instagram/app/controller/user_controller.dart';
import 'package:flutter_clean_instagram/app/ui/android/detail/write_post_page.dart';
import 'package:flutter_clean_instagram/app/ui/android/my/widgets/column_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/my/widgets/menu_bottomsheet.dart';
import 'package:flutter_clean_instagram/app/ui/android/widgets/action_icon_button.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_colors.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_text_theme.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyPage extends GetView<PostsController> {
  List<Widget> imageListGenerate(List<dynamic> imageUrlList) {
    List<Widget> widgetList = [];
    imageUrlList.forEach(
      (element) {
        widgetList.add(
          Container(
            child: Image.network(
              element.toString(),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
    return widgetList;
  }

  uploadImage(String inputSource) async {
    final picker = ImagePicker();
    List<XFile> pickedImage;
    List<Map<String, dynamic>> resultImageList = [];
    try {
      pickedImage = await picker.pickMultiImage(
        maxWidth: 1920,
      );
      pickedImage.forEach((element) {
        resultImageList.add({
          "fileName": element.path,
          "imageFile": File(
            element.path,
          ),
        });
        return resultImageList;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController _tabx = Get.put(ProfileController());
    final UserController _userController = Get.put(UserController());
    return Scaffold(
      body: GetX<PostsController>(
          init: PostsController(),
          builder: (postController) {
            List<dynamic> images = [];
            postController.postList.forEach((element) {
              images.addAll(element.images);
            });
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: AppBar(
                  backgroundColor: mainColor,
                  elevation: 0.0,
                  title: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      // Get.find<AuthController>().signOut();
                      uploadImage('camera');
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          _userController.user.name,
                          style: tabTitleTextStyle,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  actions: [
                    ActionIconButton(
                      icon: Icons.add_box_outlined,
                      onPressed: () {
                        Get.to(() => WritePostPage());
                      },
                    ),
                    ActionIconButton(
                      icon: Icons.menu,
                      onPressed: () {
                        MenuBottomSheet.menuBottomSheet(context);
                      },
                    ),
                  ],
                ),
              ),
              body: NestedScrollView(
                physics: ScrollPhysics(),
                controller: _tabx.scrollController,
                scrollDirection: Axis.vertical,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      pinned: false,
                      backgroundColor: Colors.white,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 36,
                                      backgroundImage: _userController
                                              .user.photoURL.isNotEmpty
                                          ? NetworkImage(
                                              _userController.user.photoURL)
                                          : null,
                                    ),
                                    SizedBox(height: 10),
                                    Text(_userController.user.name)
                                  ],
                                ),
                                ColumnButton(
                                  columnTextList: [
                                    Text(_userController.user.postCount
                                        .toString()),
                                    Text('게시물'),
                                  ],
                                ),
                                ColumnButton(
                                  columnTextList: [
                                    Text(
                                        _userController.user.follow.toString()),
                                    Text('팔로우'),
                                  ],
                                ),
                                ColumnButton(
                                  columnTextList: [
                                    Text(_userController.user.following
                                        .toString()),
                                    Text('팔로잉'),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 30,
                                    decoration: defaultBoxDecoration,
                                    child: Text('프로필 편집'),
                                  ),
                                ),
                                SizedBox(width: 8),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    height: 30,
                                    decoration: defaultBoxDecoration,
                                    child: Icon(Icons.arrow_drop_down),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      expandedHeight: 200,
                      bottom: TabBar(
                        controller: _tabx.controller,
                        tabs: _tabx.tabs,
                        labelColor: Colors.black,
                        indicatorColor: Colors.black,
                        indicatorWeight: 1.0,
                        unselectedLabelColor: Colors.grey,
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  controller: _tabx.controller,
                  physics: ScrollPhysics(),
                  children: [
                    ListView(
                      children: [
                        GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          children: imageListGenerate(images),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '프로필을 완성하세요',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '3/4개 완료',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 220,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ProfileSetCard(
                                mainTitle: '소개 추가',
                                subTitle: '팔로워에게 회원님에 대해 간단히 소개해주세요',
                                buttonTitle: '소개 추가',
                                icon: Icon(Icons.person_outline),
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                    Text('2'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class ProfileSetCard extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final String buttonTitle;
  final Icon icon;
  final Function onTap;
  const ProfileSetCard(
      {this.mainTitle, this.subTitle, this.buttonTitle, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.grey[300],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_outline,
                color: Colors.grey,
                size: 35,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(height: 10),
          Text(
            mainTitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: onTap ?? () {},
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              minimumSize: Size(10, 10),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
            ),
            child: Text(buttonTitle),
          )
        ],
      ),
    );
  }
}
