import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/shop/shop_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SearchPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            SearchFieldButton(
              hintText: '검색',
              onTap: () {},
            ),
            SizedBox(height: 10),
            StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.green,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text('$index'),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 2 : 1);
              },
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
            )
          ],
        ),
      ),
    );
  }
}
