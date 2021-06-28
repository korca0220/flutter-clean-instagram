import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_instargram/app/ui/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instargram',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.add_box_outlined,
            color: Colors.black,
          ),
          Icon(
            CupertinoIcons.heart,
            color: Colors.black,
          ),
          Icon(
            Icons.send_outlined,
            color: Colors.black,
          ),
        ],
        backgroundColor: mainColor,
        elevation: 0.0,
      ),
    );
  }
}
