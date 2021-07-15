import 'package:flutter/material.dart';
import 'package:flutter_clean_instagram/app/ui/theme/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  const RoundedButton({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            elevation: 0.0,
            primary: formBoxColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
