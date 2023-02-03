import 'package:flutter/cupertino.dart';

class ChatModel {
  late String name;
  late Icon icon;
  late bool isGroup;
  late String currentMessage;
  late String time;
  late bool selected;
  late int id;
  ChatModel({
    required this.name,
    required this.icon,
    required this.currentMessage,
    required this.isGroup,
    required this.time,
    required this.id,
    this.selected = false,
  });
}
