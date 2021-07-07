import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/widgets/action_icon_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/widgets/search_filed_button.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_text_theme.dart';
import 'package:get/get.dart';

class ShopPage extends GetView {
  List<String> lists = ['Shop', '에디터 추천', '컬렉션', '가이드', '동영상'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Shop',
                    style: tabTitleTextStyle,
                  ),
                ),
                Row(
                  children: [
                    ActionIconButton(
                      icon: Icons.collections_bookmark_outlined,
                    ),
                    ActionIconButton(
                      icon: Icons.menu,
                    )
                  ],
                )
              ],
            ),
            SearchFieldButton(
              hintText: 'Search 검색',
              onTap: () {},
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 30,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 8);
                },
                scrollDirection: Axis.horizontal,
                itemCount: lists.length,
                itemBuilder: (context, index) {
                  return ShopListItem(text: lists[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopListItem extends StatelessWidget {
  final String text;
  final Function onTap;
  const ShopListItem({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
