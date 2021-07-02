import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/widgets/action_icon_button.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/widgets/animation_Icon_button.dart';
import 'package:readmore/readmore.dart';

class StoryCard extends StatefulWidget {
  @override
  _StoryCardState createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        radius: 15,
                      ),
                    ),
                    Text(
                      'Junewoo Park',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.more_vert),
                )
              ],
            ),
            color: Colors.white,
          ),
          Container(
            child: Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: 230.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPage = index;
                        });
                      }),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: Image.network(
                        "https://carpeoplemarketing.com/wp-content/uploads/2018/09/WOW-Customer-1080x675.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 5,
                  right: MediaQuery.of(context).size.width * 0.02,
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${currentPage + 1}/3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  AnimationIconButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                    unSelectedIcon: Icon(
                      CupertinoIcons.heart,
                      size: 28,
                    ),
                    selectedIcon: Icon(
                      CupertinoIcons.heart_fill,
                      size: 28,
                      color: Colors.red,
                    ),
                    onTap: () {},
                  ),
                  ActionIconButton(
                    icon: CupertinoIcons.chat_bubble,
                    onPressed: () {},
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                  ),
                  ActionIconButton(
                    icon: Icons.send_rounded,
                    onPressed: () {},
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                  ),
                ],
              ),
              AnimationIconButton(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                unSelectedIcon: Icon(
                  Icons.bookmark_outline,
                  size: 28,
                ),
                selectedIcon: Icon(
                  Icons.bookmark,
                  size: 28,
                ),
                onTap: () {},
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '좋아요 320개',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ReadMoreText(
                  'Junewoo Park 내용내용내용내용내용내용내용내용내내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내내용내용용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내내용내용용내용내용내',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.start,
                  colorClickableText: Colors.black,
                  trimCollapsedText: '더보기',
                  trimExpandedText: 's',
                  trimLines: 2,
                  trimMode: TrimMode.Length,
                  trimLength: 50,
                  moreStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      '댓글 350개 모두 보기',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          '댓글 달기...',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
