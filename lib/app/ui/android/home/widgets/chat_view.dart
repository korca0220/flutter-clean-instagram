import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends GetView {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          InkWell(
            onTap: () {},
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
                      '검색',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Direct로 친구에게 메세지 보내기',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 50,
              right: 50,
            ),
            child: Text(
              '개인 메세지를 보내거나 좋아하는 게시물을 친구와 바로 굥유해보세요',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {},
              child: Text(
                '메세지 보내기',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Divider(thickness: 0.5),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
            child: Text('추천'),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 24,
                ),
                title: Text(
                  'junewoopark',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  'sub_title',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_enhance_outlined),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
