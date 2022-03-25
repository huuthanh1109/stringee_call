// import 'package:azlistview/azlistview.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:stringee_flutter_plugin_example/config/Palette.dart';
// import 'package:stringee_flutter_plugin_example/screens/call.dart';
// import 'package:stringee_flutter_plugin_example/utils/layouts.dart';
// import 'package:stringee_flutter_plugin_example/utils/styles.dart';

// class _AZItem extends ISuspensionBean {
//   final String title;
//   final String tag;

//   _AZItem({
//      this.title,
//      this.tag,
//   });
//   @override
//   String getSuspensionTag() => tag;
// }

// class PhoneBookScreen extends StatefulWidget {
//   final List<String> items;
//   const PhoneBookScreen({Key key,  this.items}) : super(key: key);

//   @override
//   _PhoneBookScreenState createState() => _PhoneBookScreenState();
// }

// class _PhoneBookScreenState extends State<PhoneBookScreen> {
//   List<_AZItem> items = [];
//   @override
//   void initState() {
//     super.initState();
//     initList(widget.items);
//   }

//   void initList(List<String> items) {
//     this.items = items
//         .map((item) => _AZItem(title: item, tag: item[0].toUpperCase()))
//         .toList();
//     SuspensionUtil.sortListBySuspensionTag(this.items);
//     SuspensionUtil.setShowSuspensionStatus(this.items);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = Layouts.getSize(context);
//     return Stack(
//       children: [
//         Scaffold(
//           backgroundColor: Palette.white,
//           appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(104),
//             child: AppBar(
//                 backgroundColor: Palette.primaryColor,
//                 // leading: MenuWidget(),
//                 elevation: 0,
//                 title: const Text(
//                   'Danh bạ',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 centerTitle: true,
//                 bottom: PreferredSize(
//                   preferredSize: Size.fromHeight(60),
//                   child: Container(
//                     color: Palette.white,
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     child: Center(
//                       child: FittedBox(
//                         child: Container(
//                           padding: const EdgeInsets.all(3.5),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50),
//                               color: Color(0xFFF4F6FD)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: size.width * 0.44,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 7),
//                                 decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.horizontal(
//                                         left: Radius.circular(50)),
//                                     color: Colors.white),
//                                 child: Center(
//                                   child: Text(
//                                     'Nội bộ',
//                                     style: Styles.subtitle1Style.copyWith(
//                                         fontWeight: FontWeight.w600,
//                                         color: Palette.primaryColor),
//                                   ),
//                                 ),
//                               ),
//                               const Gap(5),
//                               Container(
//                                 width: size.width * 0.44,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 7),
//                                 decoration: const BoxDecoration(
//                                   borderRadius: BorderRadius.horizontal(
//                                       right: Radius.circular(50)),
//                                   color: Colors.transparent,
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     'Khách hàng',
//                                     style: Styles.subtitle1Style.copyWith(
//                                         fontWeight: FontWeight.w600,
//                                         color: Palette.textColor),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )),
//           ),
//           body: SafeArea(
//             child: Scaffold(
//               appBar: PreferredSize(
//                 preferredSize: const Size.fromHeight(55),
//                 child: AppBar(
//                     elevation: 0,
//                     backgroundColor: Palette.white,
//                     bottom: PreferredSize(
//                       preferredSize: Size.fromHeight(55),
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Palette.grey90,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: const [
//                             Text(
//                               'Tìm kiếm',
//                               style: TextStyle(
//                                 color: Palette.textColor,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             Icon(
//                               CupertinoIcons.search,
//                               size: 16,
//                               color: Palette.textColor,
//                             ),
//                           ],
//                         ),
//                       ),
//                     )),
//               ),
//               body: AzListView(
//                 // padding: EdgeInsets.only(right: 30),
//                 data: items,
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   final item = items[index];
//                   return _buildListItem(item);
//                 },
//                 indexBarOptions: const IndexBarOptions(
//                     needRebuild: true,
//                     indexHintAlignment: Alignment.center,
//                     indexHintDecoration: BoxDecoration(
//                       color: Palette.primaryColor,
//                       shape: BoxShape.rectangle,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(6),
//                       ),
//                     ),
//                     textStyle: TextStyle(
//                       color: Palette.primaryColor,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12,
//                     )
//                     // downColor: Palette.primaryColor,
//                     ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 90,
//           left: 20,
//           right: 20,
//           child: Container(
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//                 color: Palette.white.withOpacity(0.95),
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     spreadRadius: 2,
//                     blurRadius: 4,
//                     offset: Offset(0, 2),
//                   ),
//                 ]),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 70,
//                       height: 70,
//                       child: Center(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(60),
//                           child: Image.network(
//                             'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Gap(20),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Nguyễn Mạnh Cường',
//                           style: TextStyle(
//                             color: Palette.textColor,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const Gap(8),
//                         Text(
//                           'Mobile',
//                           style: TextStyle(
//                             color: Palette.grey76,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const Gap(20),
//                 Row(
//                   children: [
//                     Button(
//                       title: 'Từ chối',
//                       icon: CupertinoIcons.phone_down_fill,
//                       color: Palette.primaryColor,
//                       onTap: () {},
//                     ),
//                     const Gap(20),
//                     Button(
//                       title: 'Trả lời',
//                       icon: CupertinoIcons.phone_fill,
//                       color: Palette.green,
//                       onTap: () => Navigator.of(context).push(
//                           MaterialPageRoute(builder: ((context) => Call()))),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget Button(
//           { String title,
//            IconData icon,
//            Color color,
//            Function onTap}) =>
//       Expanded(
//         child: GestureDetector(
//           // onTap:  onTap,
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: color,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   icon,
//                   size: 24,
//                   color: Palette.white,
//                 ),
//                 const Gap(4),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Palette.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );

//   Widget _buildListItem(_AZItem item) {
//     final tag = item.getSuspensionTag();
//     final offstage = !item.isShowSuspension;
//     return Column(
//       children: [
//         Offstage(
//           offstage: offstage,
//           child: buildHeader(tag),
//         ),
//         ListTile(
//           title: Text(
//             item.title,
//             style: const TextStyle(
//               color: Palette.textColor,
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           // onTap:()=> widget.
//         ),
//       ],
//     );
//   }

//   Widget buildHeader(String tag) => Container(
//         height: 30,
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.only(left: 12),
//         color: Palette.grey90,
//         child: Text(
//           tag,
//           softWrap: false,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       );
// }
