import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/home_page.dart';
import 'package:flutter_clean_instagram/app/ui/android/my/my_page.dart';
import 'package:flutter_clean_instagram/app/ui/android/reals/reals_page.dart';
import 'package:flutter_clean_instagram/app/ui/android/search/search_page.dart';
import 'package:flutter_clean_instagram/app/ui/android/shop/shop_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TabPage extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen() {
    return [
      HomePage(),
      SearchPage(),
      RealsPage(),
      ShopPage(),
      MyPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        activeColorPrimary: Colors.black87,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.search),
        activeColorPrimary: Colors.black87,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.video_collection_sharp),
        activeColorPrimary: Colors.black87,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_bag),
        activeColorPrimary: Colors.black87,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: CircleAvatar(
          radius: 12,
        ),
        activeColorPrimary: Colors.black87,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreen(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style14,
    );
  }
}
