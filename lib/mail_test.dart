import 'package:flutter/material.dart';
import '../models/mail.dart';

class MailDetail extends StatelessWidget {
  MailDetail(this.mail, {super.key});
  final Mail mail;
  final List<String> menuTabItems = [
    'กำหนดเวลาส่ง',
    'เพิ่มจากรายชื่อติดต่อ',
    'โหมดข้อมูลลับ',
    'ทิ้ง',
    'การตั้งค่า',
    'ความช่วยเหลือและความคิดเห็น',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 28,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'เขียน',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.archive_outlined),
            iconSize: 24,
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(Icons.delete),
            iconSize: 24,
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.archive_outlined),
            iconSize: 24,
            color: Colors.black,
          ),
          InkWell(
            child: PopupMenuButton(
              color: Colors.white,
              icon: const Icon(
                Icons.more_vert_rounded,
                size: 24,
                color: Colors.black,
              ),
              itemBuilder: (ctx) => menuTabItems
                  .map(
                    (itemName) => PopupMenuItem(
                      value: itemName,
                      child:
                          Text(itemName, style: const TextStyle(fontSize: 17)),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
      body: Column(children: [
        Text(
          mail.description,
          style: TextStyle(fontSize: 17),
        ),
        Text('data')
      ]),
    );
  }
}
