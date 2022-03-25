import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';
import 'package:stringee_flutter_plugin_example/models/chat_messages.dart';
import 'package:stringee_flutter_plugin_example/models/messages.dart';

class MessagerScreen extends StatefulWidget {
  final Messages id;
  const MessagerScreen({Key key, this.id}) : super(key: key);

  @override
  _MessagerScreenState createState() => _MessagerScreenState();
}

class _MessagerScreenState extends State<MessagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(104),
      //   child: AppBar(
      //     backgroundColor: Palette.primaryColor,
      //     // leading: MenuWidget(),
      //     elevation: 0,
      //     title: const Text(
      //       'Điện thoại',
      //       style: TextStyle(fontSize: 18),
      //     ),
      //     centerTitle: true,
      //   ),
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BackButton(),
                      Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.network(
                                  widget.id.imgPath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.id.fullname,
                            style: const TextStyle(
                              color: Palette.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(4),
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Palette.green,
                                ),
                              ),
                              const Gap(4),
                              const Text(
                                'active now',
                                style: TextStyle(
                                  color: Palette.textColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  // Row(
                  //   children: const [
                  //     Boxes(
                  //       borderRadius: 7.0,
                  //       color: Palette.greyText,
                  //       size: 18,
                  //       icon: Icons.call,
                  //     ),
                  //     SizedBox(
                  //       width: 5,
                  //     ),
                  //     Boxes(
                  //       borderRadius: 7.0,
                  //       size: 18,
                  //       color: Palette.greyText,
                  //       icon: Icons.video_call_rounded,
                  //     ),
                  //   ],
                  // )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 20,
                width: 75,
                child: Center(
                  child: Text(
                    "11:05 AM",
                    // style: GoogleFonts.aBeeZee(
                    //   fontSize: 12,
                    // ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Palette.white.withOpacity(.6),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 3,
              ),
              Stack(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: chatMessages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment:
                              chatMessages[index].messageType == "Sender"
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  chatMessages[index].messageType == "Sender"
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight: double.infinity,
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child:
                                          // chatMessages[index].isVoicenote ==
                                          //         false
                                          //     ?
                                          Text(
                                        chatMessages[index].message,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              chatMessages[index].messageType ==
                                                      "Sender"
                                                  ? Palette.primaryColor
                                                  : Palette.white,
                                        ),
                                      )
                                      // : Container()
                                      // Image.asset(
                                      //     'assets/images/voicevn.png',
                                      //     fit: BoxFit.cover,
                                      //     color: chatMessages[index]
                                      //                 .messageType ==
                                      //             "Sender"
                                      //         ? Palette.primaryColor
                                      //         : Palette.white,
                                      //   ),
                                      ),
                                  decoration: BoxDecoration(
                                    color: chatMessages[index].messageType ==
                                            "Sender"
                                        ? Palette.grey90
                                        : Palette.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                // Visibility(
                                //   visible: chatMessages[index].messageType ==
                                //       "Receiver",
                                //   child: Container(
                                //     height: 30,
                                //     width: 30,
                                //     child: Text('aaaa'),
                                //     // child: Image.asset(memoji1),
                                //     decoration: const BoxDecoration(
                                //       color: Palette.white,
                                //       shape: BoxShape.circle,
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, left: 4),
                              child: Row(
                                mainAxisAlignment:
                                    chatMessages[index].messageType == "Sender"
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                children: [
                                  Text(
                                    chatMessages[index].time,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Palette.textColor,
                                    ),
                                  ),
                                  Visibility(
                                    visible: chatMessages[index].isRead == true,
                                    child: const Icon(
                                      CupertinoIcons.checkmark_alt,
                                      color: CupertinoColors.activeGreen,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Type a message...',
                              style: TextStyle(color: Palette.textColor),
                            ),
                            Container(
                              width: 40,
                              child: const Center(
                                child: Icon(
                                  Icons.send,
                                  color: Palette.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.9,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.9,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.9,
                              spreadRadius: 1,
                            )
                          ]),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
