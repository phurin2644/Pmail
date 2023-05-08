import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();


class Mail {
  

  Mail({
    required this.title,
    required this.date,
    required this.description,
    required this.content,
    required this.isRead,
    required this.color,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String description;
  final String content;
  bool isRead;
  final Color color;
  bool isStar = false;
  bool isDelete = false;
 
  final DateTime date;
}
