// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;
  final bool isStickers;

  const CircleButton({
    Key key,
    this.icon,
     this.iconSize,
     this.onPressed,
    this.isStickers = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            iconSize: iconSize,
            onPressed: onPressed(),
          ),
        ),
        isStickers
            ? Positioned(
                top: 6,
                right: 6,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Palette.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
