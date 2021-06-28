import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/widgets/action_icon_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/widgets/circle_profile_bar.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/widgets/story_card.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_colors.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_text_theme.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: appBarTextStyle,
        ),
        actions: [
          ActionIconButton(
            onPressed: () {},
            icon: Icon(Icons.add_box_outlined),
          ),
          ActionIconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.heart),
          ),
          ActionIconButton(
            onPressed: () {},
            icon: Icon(Icons.send_sharp),
          ),
        ],
        backgroundColor: mainColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              CircleProfileBar(),
              SizedBox(height: 5),
              Divider(
                thickness: 0.5,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 30);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return StoryCard();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
