
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';
import 'package:stringee_flutter_plugin_example/models/user.dart';

import 'messager_screen.dart';

class Details extends StatefulWidget {
  final User user;
  final Function onTap;

  const Details({Key key, this.onTap, this.user}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _colorTheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          color: _colorTheme.surface,
          width: _size.width,
          height: _size.height,
          child: Column(
            children: <Widget>[
              const Gap(20),
              Container(
                width: 100,
                height: 100,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      // 'http://192.168.1.11${widget.user.image_path.substring(6)}',
                      'http://192.168.1.11/images/1646819501.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              const Text(
                'Giap Chi Cong',
                style: TextStyle(
                  color: Palette.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              const Text(
                '0123456789',
                style: TextStyle(
                  color: Palette.grey46,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonContact(
                    title: 'Messager',
                    icon: CupertinoIcons.chat_bubble_text_fill,
                    // child: MessagerScreen(
                    //   // id: messages[1],
                    // ),
                  ),
                  const Gap(20),
                  ButtonContact(
                    title: 'Call',
                    icon: CupertinoIcons.phone_fill,
                    // child: Call(),
                  ),
                  const Gap(20),
                  ButtonContact(
                    title: 'Video Call',
                    icon: CupertinoIcons.videocam_fill,
                    // child: Call(),
                  ),
                ],
              ),
              const Gap(20),
              ContactContainer(),
              CallList(),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 12,
          child: GestureDetector(
            // onTap: widget.onTap(),
            child: Container(
              child: Icon(
                CupertinoIcons.arrow_down,
                color: Palette.primaryColor,
                size: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget ButtonContact({String title, IconData icon, Widget child}) =>
      GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => child))),
        child: Container(
          width: 90,
          padding: EdgeInsetsDirectional.all(8),
          decoration: BoxDecoration(
            color: Palette.bgError,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: Palette.primaryColor,
              ),
              const Gap(4),
              Text(
                title,
                style: const TextStyle(
                  color: Palette.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      );
  Widget ContactContainer() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Thông tin liên hệ:',
                  style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 16,
                  ),
                ),
                Gap(8),
                Text(
                  'NỘI BỘ',
                  style: TextStyle(
                    color: Palette.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Email',
                  style: TextStyle(
                    color: Palette.grey46,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'cuong.sa@gmail.com.vn',
                  style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Vị trí',
                  style: TextStyle(
                    color: Palette.grey46,
                    fontSize: 14,
                  ),
                ),
                Gap(8),
                Text(
                  'Sale Leader',
                  style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Phòng ban',
                  style: TextStyle(
                    color: Palette.grey46,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'MYDINH - METRI',
                  style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      );

  Widget CallList() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Palette.grey90,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hôm qua',
              style: TextStyle(
                color: Palette.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(12),
            Row(
              children: [
                Text(
                  '10:24 AM',
                  style: TextStyle(
                    color: Palette.grey46,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: Text(
                    'Cuộc gọi đến',
                    style: TextStyle(
                      color: Palette.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  '2 phút',
                  style: TextStyle(
                    color: Palette.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const Gap(8),
            Row(
              children: [
                Text(
                  '10:23 AM',
                  style: TextStyle(
                    color: Palette.grey46,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: Text(
                    'Cuộc gọi nhỡ',
                    style: TextStyle(
                      color: Palette.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  '3 phút',
                  style: TextStyle(
                    color: Palette.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
