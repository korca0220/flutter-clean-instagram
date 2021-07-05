import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/direct_home.dart';
import 'package:flutter_clean_instagram/app/ui/android/home/main_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        MainPage(),
        DirectPage(
          onBackTap: () {
            _controller.previousPage(
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
        ),
      ],
    );
  }
}
