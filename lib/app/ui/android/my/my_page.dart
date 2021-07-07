import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/my/profile_controller.dart';
import 'package:flutter_clean_instagram/app/ui/android/my/widgets/column_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/widgets/action_icon_button.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_colors.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_text_theme.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';

class MyPage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final ProfileController _tabx = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
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
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Text(
                    'parkjunewoo',
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
              ActionIconButton(icon: Icons.add_box_outlined),
              ActionIconButton(icon: Icons.menu),
            ],
          ),
        ),
        body: ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 36,
                        ),
                        SizedBox(height: 10),
                        Text('Junewoo park')
                      ],
                    ),
                    ColumnButton(
                      columnTextList: [
                        Text('1'),
                        Text('게시물'),
                      ],
                    ),
                    ColumnButton(
                      columnTextList: [
                        Text('404'),
                        Text('팔로우'),
                      ],
                    ),
                    ColumnButton(
                      columnTextList: [
                        Text('1213'),
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
                        width: MediaQuery.of(context).size.width * 0.85,
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
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: 30,
                        decoration: defaultBoxDecoration,
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TabBar(
                  controller: _tabx.controller,
                  tabs: _tabx.tabs,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  indicatorWeight: 1.0,
                  unselectedLabelColor: Colors.grey,
                ),
                Container(
                  height: 300,
                  child: TabBarView(
                    controller: _tabx.controller,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                          child: GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        children: [
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.green,
                          ),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.green,
                          ),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.green,
                          ),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.green,
                          ),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.green,
                          ),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.green,
                          ),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.green,
                          )
                        ],
                      )),
                      Container(
                        child: Center(
                          child: Text('ff'),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text('프로필을 완성하세요')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
