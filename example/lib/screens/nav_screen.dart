//ignore_for_file: prefer_const_constructors, unused_field, deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_final_fields, avoid_print, unnecessary_this


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';
import 'package:stringee_flutter_plugin_example/screens/call_container_screen.dart';
import 'package:stringee_flutter_plugin_example/screens/phone_book_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  get initialValue => null;

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 10);
  static List<Widget> _screens = [
    // HomeScreen(),
    // LocationScreen(),
    CallContainerScreen(),
    // MessagerScreen(id: messages[index],),
    // Scaffold(),
    PhoneBookScreen(
      items: [
        'A.Thành - TVSI',
        'A.Huy - TVSI',
        'A.KHánh - TVSI',
        'B.Cường - HR',
        'B.Đat - HR',
        'C.Huyền - HR',
        'C.Thanh - Kế Toán',
        'Phương - Saler',
        'Hùng - Saler',
        'Nam - Saler',
        'Hiếu - Saler',
        'V.Phương - Marketing',
        'Giang - Saler',
        'Minh - Saler',
        'Quân - Saler',
        'Đức - Saler',
        'Vũ - Saler',
        'Tâm - Saler',
        'Uyên - Saler',
      ],
    ),
  ];
  Future showStatusBar() =>
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  @override
  void initState() {
    // var count = widget.initialValue.length; // Initial value
    showStatusBar();
    super.initState();
  }

  void _onItemTapped(int index) {
    this.setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedIndex);
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: optionStyle,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            // icon: svgIcon('images/home.svg'),
            title: Text(
              'Home',
              style: optionStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            title: Text(
              'Call',
              style: optionStyle,
            ),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Palette.primaryColor,
      ),
    );
  }
}
