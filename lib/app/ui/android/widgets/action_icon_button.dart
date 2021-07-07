import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final EdgeInsets padding;
  const ActionIconButton({
    this.onPressed,
    this.icon,
    this.padding = const EdgeInsets.only(right: 10, left: 10),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: padding,
        child: Icon(
          icon,
          color: Colors.black,
          size: 26,
        ),
      ),
    );
  }
}
