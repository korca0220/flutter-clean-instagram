import 'package:flutter/material.dart';

class RoomsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            width: 60,
            child: Image.asset('assets/images/rooms_image.jpg'),
          ),
          Text(
            '원하는 모든 사람과 영상 통화',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '상대방이 Instagram을 상요하지 않아도 상대방을 영상 통화에 초대하려면 링크를 공유하세요.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '룸스 만들기',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
