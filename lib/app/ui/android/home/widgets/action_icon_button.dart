import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final Function onPressed;
  final Icon icon;
  const ActionIconButton({this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      icon: icon,
      color: Colors.black,
    );
  }
}
