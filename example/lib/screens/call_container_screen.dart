
import 'package:flutter/material.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';
import 'package:stringee_flutter_plugin_example/models/user.dart';
import 'package:stringee_flutter_plugin_example/services/user_service.dart';
import 'package:we_slide/we_slide.dart';

import 'call_screen.dart';
import 'detail.dart';

class CallContainerScreen extends StatefulWidget {
  CallContainerScreen({Key key}) : super(key: key);

  @override
  _CallContainerScreenState createState() => _CallContainerScreenState();
}

class _CallContainerScreenState extends State<CallContainerScreen> {
  final userService = UserService();
  List<User> userList = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _getEvent();
  }

  void _getEvent() async {
    setState(() {
      isLoading = true;
    });
    userList = await userService.fetchUsers();
    print('.............${userList}');
    setState(() {
      isLoading = false;
    });
  }

  void _getEvent1() async {
    // userList = await userService.fetchUser();
    setState(() {
      userList[1];
      print('item......${userList[1]}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _controller = WeSlideController();
    return Scaffold(
      body: SafeArea(
        child: WeSlide(
          controller: _controller,
          parallax: true,
          animateDuration: const Duration(milliseconds: 100),
          transformScale: true,
          bodyBorderRadiusBegin: 0.0,
          bodyBorderRadiusEnd: 12.0,
          panelBorderRadiusBegin: 0.0,
          panelBorderRadiusEnd: 12.0,
          transformScaleEnd: 0.85,
          panelMinSize: 0.0,
          panelMaxSize: _size.height * 0.93,
          body: isLoading
              ? const Scaffold(
                  backgroundColor: Palette.white,
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Palette.primaryColor,
                    ),
                  ),
                )
              : CallScreen(
                  onTap: _controller.show,
                ),
          panel: Details(onTap: _controller.hide),
          // footer: Container(),
          //appBar: AppBar(),
        ),
      ),
    );
  }
}
