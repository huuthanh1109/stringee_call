import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';
import 'package:stringee_flutter_plugin_example/blocs/call_bloc.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';
import 'package:stringee_flutter_plugin_example/models/theme_model.dart';
import 'package:stringee_flutter_plugin_example/models/user.dart';
import 'package:stringee_flutter_plugin_example/services/user_service.dart';
import 'package:stringee_flutter_plugin_example/ui/call.dart';
import 'package:stringee_flutter_plugin_example/utils/layouts.dart';
import 'package:stringee_flutter_plugin_example/utils/styles.dart';
import 'package:stringee_flutter_plugin_example/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

StringeeClient client = new StringeeClient();

class CallScreen extends StatefulWidget {
  final Function onTap;
  final dynamic user;
  final List<User> state;

  const CallScreen({Key key, this.onTap, this.user, this.state})
      : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final userService = UserService();
  List<User> userList = [];
  bool isLoading = false;
  bool isCall = false;

  User userDetail;

  String myUserId = '';
  dynamic toUser = '';
  String token = '';
  dynamic toUserInfo;
  dynamic toNameUser;
  dynamic nameUser;

  @override
  void initState() {
    super.initState();
    _getEvent();
    // _getUser(1);
    token = widget.user["token_call"];
    nameUser = widget.user["name"];

    userList = widget.state;

    getIt
        .isReady<ThemeModel>()
        .then((_) => getIt<ThemeModel>().addListener(update));

    /// Lắng nghe sự kiện của StringeeClient(kết nối, cuộc gọi đến...)
    client.eventStreamController.stream.listen((event) {
      Map<dynamic, dynamic> map = event;
      switch (map['eventType']) {
        case StringeeClientEvents.didConnect:
          handleDidConnectEvent();
          break;
        case StringeeClientEvents.didDisconnect:
          handleDiddisconnectEvent();
          break;
        case StringeeClientEvents.didFailWithError:
          handleDidFailWithErrorEvent(
              map['body']['code'], map['body']['message']);
          break;
        case StringeeClientEvents.requestAccessToken:
          handleRequestAccessTokenEvent();
          break;
        case StringeeClientEvents.didReceiveCustomMessage:
          handleDidReceiveCustomMessageEvent(map['body']);
          break;
        case StringeeClientEvents.incomingCall:
          StringeeCall call = map['body'];
          handleIncomingCallEvent(call);
          break;
        case StringeeClientEvents.incomingCall2:
          StringeeCall2 call = map['body'];
          handleIncomingCall2Event(call);
          break;
        default:
          break;
      }
    });

    /// Connect
    if (token.isNotEmpty) {
      client.connect(token);
    }
  }

  @override
  void dispose() {
    _getEvent();
    // _getUser;
    super.dispose();
  }

  // Map<dynamic, dynamic> parseJwt(String token) {
  //   final parts = token.split('.');
  //   if (parts.length != 3) {
  //     throw Exception('invalid token');
  //   }

  //   final payload = _decodeBase64(parts[1]);
  //   final payloadMap = json.decode(payload);
  //   if (payloadMap is! Map<String, dynamic>) {
  //     throw Exception('invalid payload');
  //   }
  //   print(payloadMap);
  //   return payloadMap;
  // }

  // String _decodeBase64(String str) {
  //   String output = str.replaceAll('-', '+').replaceAll('_', '/');

  //   switch (output.length % 4) {
  //     case 0:
  //       break;
  //     case 2:
  //       output += '==';
  //       break;
  //     case 3:
  //       output += '=';
  //       break;
  //     default:
  //       throw Exception('Illegal base64url string!"');
  //   }

  //   return utf8.decode(base64Url.decode(output));
  // }

  void update() => setState(() => {});

  void _getEvent() async {
    setState(() {
      isLoading = true;
    });
    widget.state;
    userList = await userService.fetchUsers();
    setState(() {
      isLoading = false;
    });
  }

  void _getUser(dynamic id) async {
    setState(() {
      isCall = true;
    });
    userDetail = await userService.fetchUser(id);
    setState(() {
      isCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    // final LoadingDataBloc loadingDataBloc = context.read<LoadingDataBloc>();
    print('state: ${widget.state}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Call Screen",
      theme: getIt<ThemeModel>().theme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        // backgroundColor: Palette.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          // preferredSize: const Size.fromHeight(104),
          child: AppBar(
            backgroundColor: Palette.primaryColor,
            // leading: MenuWidget(),
            elevation: 0,
            title: const Text(
              'Điện thoại',
              style: TextStyle(fontSize: 16),
            ),
            centerTitle: true,
            leading: CircleButton(
              icon: CupertinoIcons.bell_fill,
              iconSize: 22,
              isStickers: true,
              onPressed: () {},
            ),
            actions: [
              CircleButton(
                icon: CupertinoIcons.search,
                iconSize: 24,
                isStickers: false,
                onPressed: () {},
              ),
            ],
            //   bottom: PreferredSize(
            //     preferredSize: Size.fromHeight(60),
            //     child: Container(
            //       color: Palette.white,
            //       padding: const EdgeInsets.symmetric(vertical: 8),
            //       child: Center(
            //         child: FittedBox(
            //           child: Container(
            //             padding: const EdgeInsets.all(3.5),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(50),
            //               color: Color(0xFFF4F6FD),
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Container(
            //                   width: size.width * 0.44,
            //                   padding: const EdgeInsets.symmetric(vertical: 7),
            //                   decoration: const BoxDecoration(
            //                     borderRadius: BorderRadius.horizontal(
            //                         left: Radius.circular(50)),
            //                     color: Colors.white,
            //                   ),
            //                   child: Center(
            //                     child: Text(
            //                       'Nội bộ',
            //                       style: Styles.subtitle1Style.copyWith(
            //                         fontWeight: FontWeight.w600,
            //                         color: Palette.primaryColor,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 const Gap(5),
            //                 Container(
            //                   width: size.width * 0.44,
            //                   padding: const EdgeInsets.symmetric(vertical: 7),
            //                   decoration: const BoxDecoration(
            //                     borderRadius: BorderRadius.horizontal(
            //                       right: Radius.circular(50),
            //                     ),
            //                     color: Colors.transparent,
            //                   ),
            //                   child: Center(
            //                     child: Text(
            //                       'Khách hàng',
            //                       style: Styles.subtitle1Style.copyWith(
            //                         fontWeight: FontWeight.w600,
            //                         color: Palette.textColor,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            color: Palette.primaryColor,
            displacement: 10,
            onRefresh: () async {
              _getEvent();
            },
            child: CustomScrollView(
              slivers: [
                // SliverPadding(
                //   padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                //   //Data
                //   sliver: SliverToBoxAdapter(
                //     child: Text(
                //       'ID người dùng: $myUserId',
                //       style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ),
                // ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  //Data
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Tên người dùng: $nameUser',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                !isLoading
                    ? SliverPadding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        //Data
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final User user = userList[index];
                              // final LoadingDataBloc loadingDataBloc =
                              //     context.read<LoadingDataBloc>();
                              // print(
                              //     'status log: ${loadingDataBloc..add(LoadingDataEvent.done)}');

                              return ItemContact(
                                user: user,
                                onTap: widget.onTap,
                                handleCall: () {
                                  setState(() {
                                    // _getUser(user.id);
                                    // toUser = parseJwt(user.token_call)["userId"];
                                    // print('toUser ${userDetail}');
                                    // toUser = userDetail.account;
                                    print('toUser ${user.account}');
                                    toUser = user.account;
                                    toUserInfo = user.image_path;
                                    toNameUser = user.name;
                                  });
                                  callTapped(
                                      false, StringeeObjectEventType.call2);
                                },
                                handleVideoCall: () {
                                  setState(() {
                                    // _getUser(user.id);
                                    // toUser = parseJwt(user.token_call)["userId"];
                                    toUser = user.account;
                                    toUserInfo = user.image_path;
                                    toNameUser = user.name;
                                  });
                                  callTapped(
                                      true, StringeeObjectEventType.call2);
                                },
                              );
                            },
                            childCount: userList.length,
                          ),
                        ),
                      )
                    : SliverPadding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return buildBookingShimer();
                            },
                            childCount: userList.length,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        // ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'tag',
          // onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: ((context) => ListProject()))),
          onPressed: getIt<ThemeModel>().themeSetting,
          child: const Icon(CupertinoIcons.moon_fill),
          backgroundColor: Palette.primaryColor,
        ),
      ), //
    );
  }

  Widget ItemContact({
    User user,
    Function onTap,
    Function handleCall,
    Function handleVideoCall,
  }) =>
      SlidableWidget(
        onDismissed: (action) => dismissSlidableItem(context),
        handleCall: handleCall,
        handleVideoCall: handleVideoCall,
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  backgroundImage: user.image_path != null
                      ? NetworkImage(
                          'http://192.168.1.21${user.image_path.substring(6)}')
                      : AssetImage('assets/images/transparent.png'),
                  foregroundColor: Colors.white,
                  radius: 30,
                  onBackgroundImageError: user.image_path != null
                      ? (e, stackTrace) {
                          print('e: ${e}');
                        }
                      : null,
                  child: user.image_path == null
                      ? Center(
                          child: Text(
                            user.name[0].toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        )
                      : Container(height: 0, width: 0),
                ),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          // color: Palette.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(8),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.phone_fill,
                            size: 14,
                            color: Palette.grey63,
                          ),
                          Gap(4),
                          Text(
                            user.phone_number,
                            style: const TextStyle(
                              color: Palette.grey63,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  CupertinoIcons.info_circle,
                  size: 20,
                  // color: Palette.grey46,
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildBookingShimer() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ShimmerWidget.circular(
              width: 65,
              height: 65,
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 14,
                ),
                const Gap(8),
                Row(
                  children: [
                    ShimmerWidget.rectangular(
                      height: 10,
                      width: 10,
                    ),
                    const Gap(4),
                    ShimmerWidget.rectangular(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
  void dismissSlidableItem(BuildContext context) {}

  //region Handle Client Event
  void handleDidConnectEvent() {
    setState(() {
      myUserId = client.userId;
    });
  }

  void handleDiddisconnectEvent() {
    setState(() {
      myUserId = 'Not connected';
    });
  }

  void handleDidFailWithErrorEvent(int code, String message) {
    print('code: ' + code.toString() + '\nmessage: ' + message);
  }

  void handleRequestAccessTokenEvent() {
    print('Request new access token');
  }

  void handleDidReceiveCustomMessageEvent(Map<dynamic, dynamic> map) {
    print('from: ' +
        map['fromUserId'] +
        '\nmessage: ' +
        map['message'].toString());
  }

  void handleIncomingCallEvent(StringeeCall call) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Call(
          client,
          call.from,
          call.to,
          true,
          call.isVideoCall,
          toUserInfo,
          toNameUser,
          StringeeObjectEventType.call,
          stringeeCall: call,
        ),
      ),
    );
  }

  void handleIncomingCall2Event(StringeeCall2 call) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Call(
          client,
          call.from,
          call.to,
          true,
          call.isVideoCall,
          toUserInfo,
          toNameUser,
          StringeeObjectEventType.call2,
          stringeeCall2: call,
        ),
      ),
    );
  }

  void callTapped(bool isVideoCall, StringeeObjectEventType callType) {
    if (toUser.isEmpty || !client.hasConnected) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            // MultiBlocProvider(
            // providers: [
            //   BlocProvider(
            //     create: (BuildContext context) => CallBloc(),
            //   ),
            // ],
            // child:
            Call(
          client,
          client.userId,
          toUser,
          false,
          isVideoCall,
          toUserInfo,
          toNameUser,
          callType,
        ),
        // ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
