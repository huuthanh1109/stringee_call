// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';

class RoundedButton extends StatelessWidget {
  final double size;
  final String title;
  final Function onTap;
  final Color color;
  const RoundedButton({Key key, this.size, this.title, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size * 0.8,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   stops: [0.0, 1.0],
          //   colors: [color.withOpacity(0.7), color],
          //   tileMode: TileMode.clamp,
          // ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Palette.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
