
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:stringee_flutter_plugin_example/config/Palette.dart';

// class Call extends StatefulWidget {
//   const Call({Key key}) : super(key: key);

//   @override
//   _CallState createState() => _CallState();
// }

// class _CallState extends State<Call> {
//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Palette.scaffold,
//       body: Stack(
//         children: [
//           Container(
//             width: _size.width,
//             padding: EdgeInsetsDirectional.only(top: _size.width * 0.3),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 150,
//                   height: 150,
//                   child: Center(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(100),
//                       child: Image.network(
//                         'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Gap(20),
//                 const Text(
//                   'Nguyễn Mạnh Cường',
//                   style: TextStyle(
//                     color: Palette.textColor,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const Gap(10),
//                 const Text(
//                   '00:01',
//                   style: TextStyle(
//                     color: Palette.grey46,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const Gap(30),
//                 const Text(
//                   'Cuộc gọi có ghi âm để cải thiện dịch vụ',
//                   style: TextStyle(
//                     color: Palette.grey76,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 40,
//             right: _size.width * 0.15,
//             left: _size.width * 0.15,
//             child: Container(
//               width: _size.width * 0.7,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     padding: EdgeInsetsDirectional.all(20),
//                     decoration: BoxDecoration(
//                       color: Palette.grey90,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       CupertinoIcons.mic_slash_fill,
//                       size: 32,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       padding: EdgeInsetsDirectional.all(20),
//                       decoration: BoxDecoration(
//                         color: Palette.primaryColor,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         CupertinoIcons.phone_down_fill,
//                         size: 32,
//                         color: Palette.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsetsDirectional.all(20),
//                     decoration: BoxDecoration(
//                       color: Palette.grey90,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       CupertinoIcons.volume_up,
//                       size: 32,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
