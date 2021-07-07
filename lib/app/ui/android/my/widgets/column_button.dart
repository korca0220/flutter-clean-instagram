import 'package:flutter/material.dart ';

class ColumnButton extends StatelessWidget {
  final List<Text> columnTextList;
  final Function onTap;

  const ColumnButton({this.columnTextList, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        children: columnTextList,
      ),
    );
  }
}
