// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';

enum SlidableAction { chat, call, delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final bool isLiked;
  final Function(SlidableAction) onDismissed;
  final Function handleCall;
  final Function handleVideoCall;
  final Function handleDeleteUser;

  const SlidableWidget({
    this.child,
    this.onDismissed,
    this.handleCall,
    this.handleVideoCall,
    this.handleDeleteUser,
    this.isLiked = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        // actionExtentRatio: 0.25,
        child: child,
        secondaryActions: [
          GestureDetector(
            onTap: () => {
              handleCall(),
              onDismissed(SlidableAction.call),
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: 80,
              height: 90,
              child: ItemButton(image: 'phone-call', title: 'Call'),
              decoration: BoxDecoration(
                color: Palette.btnActive,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              handleVideoCall(),
              onDismissed(SlidableAction.chat),
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: 80,
              height: 90,
              child: ItemButton(image: 'video-camera', title: 'Video call'),
              decoration: BoxDecoration(
                color: Palette.moonstone,
              ),
            ),
          ),
        ],
        actions: <Widget>[
          GestureDetector(
            onTap: () => {
              handleDeleteUser(),
              onDismissed(SlidableAction.delete),
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: 80,
              height: 90,
              child: ItemButton(image: 'trash', title: 'Delete'),
              decoration: BoxDecoration(
                color: Palette.primaryColor,
              ),
            ),
          ),
        ],
      );

  Widget ItemButton({String image, String title}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$image.png',
            width: 18,
            height: 18,
          ),
          const Gap(4),
          Text(
            title,
            style: TextStyle(
              color: Palette.white,
              fontSize: 12,
            ),
          )
        ],
      );
}
