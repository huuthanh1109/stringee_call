import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  VoidCallback onPressed;
  Icon icon;
  double radius;
  Color color;

  RoundedButton({
    this.icon,
    this.color,
    this.radius,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: icon,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            bottom: 5.0,
            top: 5.0,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            side: BorderSide(color: color),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
