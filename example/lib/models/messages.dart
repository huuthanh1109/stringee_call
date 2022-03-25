import 'package:flutter/material.dart';

class Messages {
  final String name;
  final String imgPath;
  final bool hasStory;
  final Color color;
  final String time;
  final String message;
  final String fullname;
  final bool isTypng;
  final bool isFirst;
  final int messages;
  final bool unread;
  final bool isonline;

  Messages(
      { this.name,
       this.time,
       this.message,
       this.fullname,
       this.imgPath,
       this.isFirst,
       this.isonline,
       this.messages,
       this.color,
       this.unread,
       this.isTypng,
       this.hasStory});
}

List<Messages> messages = [
  Messages(
      color: Colors.greenAccent,
      imgPath:
          'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
      messages: 6,
      name: "A.Cường",
      isFirst: true,
      hasStory: true,
      fullname: "Alex Yunith",
      message: "Hey, i just sent the package",
      isonline: true,
      unread: true,
      isTypng: false,
      time: "2 MINS AGO"),
  Messages(
      color: Colors.blueAccent,
      imgPath:
          'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
      name: "Gold",
      hasStory: true,
      isFirst: false,
      isTypng: true,
      fullname: "A.Cường",
      message: "Hey Goodday!",
      isonline: true,
      messages: 2,
      unread: true,
      time: "1 HOURS AGO"),
  Messages(
      color: Colors.purpleAccent,
      isFirst: false,
      imgPath:
          'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
      name: "Dean",
      hasStory: true,
      isTypng: false,
      isonline: true,
      fullname: "A.Cường",
      message: "Hey Goodday!",
      messages: 3,
      unread: true,
      time: "1 HOURS AGO"),
  Messages(
    color: Colors.deepOrangeAccent,
    isFirst: false,
    imgPath:
        'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
    name: "Wealth",
    hasStory: false,
    fullname: "A.Cường",
    message: "Got the sheets!",
    messages: 6,
    isonline: false,
    unread: false,
    isTypng: false,
    time: "20 HOURS AGO",
  ),
  Messages(
      color: Colors.amberAccent,
      isFirst: false,
      imgPath:
          'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
      name: "Kim",
      hasStory: false,
      fullname: "A.Cường",
      message: "Hey Goodday!",
      unread: false,
      isonline: true,
      messages: 12,
      isTypng: true,
      time: "YERSTERDAY"),
  Messages(
      color: Colors.indigoAccent,
      isFirst: false,
      imgPath:
          'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
      hasStory: false,
      messages: 10,
      unread: false,
      name: "Sam",
      isTypng: false,
      fullname: "GolBerg GoldBerg",
      message: "You: OKay, got it",
      isonline: false,
      time: "5 DAYS AGO"),
  Messages(
      color: Colors.indigoAccent,
      isFirst: false,
      imgPath:
          'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
      hasStory: false,
      unread: true,
      name: "Sam",
      isTypng: false,
      isonline: true,
      fullname: "Felix Anderson",
      message: "Alright well do just that",
      messages: 3,
      time: "5 DAYS AGO"),
  Messages(
      color: Colors.indigoAccent,
      isFirst: false,
      imgPath:
          'https://i.pinimg.com/564x/21/6a/4e/216a4e255e8d97ad37941db182ea5291.jpg',
      hasStory: false,
      unread: true,
      name: "Sam",
      isTypng: false,
      messages: 1,
      fullname: "Pharell",
      isonline: false,
      message: "I just returned those items to the store",
      time: "5 DAYS AGO"),
];
