import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      height: 300,
      color: Colors.red,
      child: Column(
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
          Divider(
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
