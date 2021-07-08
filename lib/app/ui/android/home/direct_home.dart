import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/controller/home/direct_page_controller.dart';
import 'package:flutter_clean_instagram/app/ui/android/widgets/action_icon_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/widgets/chat_view.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/widgets/rooms_view.dart';
import 'package:get/get.dart';

class DirectPage extends GetView<DirectPageController> {
  final Function onBackTap;
  const DirectPage({this.onBackTap});

  @override
  Widget build(BuildContext context) {
    final DirectPageController _tabx = Get.put(DirectPageController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onBackTap,
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: Colors.white,
          ),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'parkjunewoo',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
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
            onPressed: () {},
            icon: Icons.videocam_outlined,
            padding: EdgeInsets.only(right: 5),
          ),
          ActionIconButton(
            onPressed: () {},
            icon: Icons.add,
          )
        ],
        bottom: TabBar(
          controller: _tabx.controller,
          tabs: _tabx.tabs,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          indicatorWeight: 1.0,
          unselectedLabelColor: Colors.grey,
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabx.controller,
        children: [
          ChatView(),
          RoomsView(),
        ],
      ),
    );
  }
}
