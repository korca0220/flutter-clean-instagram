import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/widgets/action_icon_button.dart';
import 'package:get/get.dart';

class ShopPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Shop',
                    style: TextStyle(fontSize: 22),
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
          ],
        ),
      ),
    );
  }
}

class SearchFieldButton extends StatelessWidget {
  final String hintText;
  final Function onTap;
  const SearchFieldButton({this.hintText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Row(
          children: [
            SizedBox(width: 15),
            Icon(
              Icons.search,
              size: 20,
              color: Colors.grey,
            ),
            SizedBox(width: 10),
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text(
                hintText,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
