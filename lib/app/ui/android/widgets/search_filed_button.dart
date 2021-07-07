import 'package:flutter/material.dart';

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
