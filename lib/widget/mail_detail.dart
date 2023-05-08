import 'dart:math';

import 'package:flutter/material.dart';
import '../models/mail.dart';

class MailDetail extends StatefulWidget {
  const MailDetail(this.mail, {super.key});
  final Mail mail;

  @override
  State<MailDetail> createState() => _MailDetailState();
}

class _MailDetailState extends State<MailDetail> {
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
              setState(() {
                widget.mail.isDelete = true;
              });
              Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 5, 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.mail.description +
                          'sssdkkdkdksdksdksdksdksdksdkkdksdksdkskdkdksdkskdsdnnfn',
                      style: TextStyle(fontSize: 17),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.mail.isStar = !widget.mail.isStar;
                      });
                    },
                    icon: Icon(
                      widget.mail.isStar ? Icons.grade : Icons.grade_outlined,
                      size: 26,
                      color: widget.mail.isStar
                          ? Colors.brown.shade400
                          : const Color.fromARGB(255, 117, 117, 117),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 15, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: widget.mail.color,
                          radius: 21.5,
                          child: Text(
                            widget.mail.title.substring(0, 1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.mail.title,
                                  style: const TextStyle(fontSize: 17),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  '22.44',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'ถึง ฉัน',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(Icons.expand_more),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: const [
                        Icon(Icons.keyboard_return),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.more_vert_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 5, 10),
              child: Row(
                children: [
                  Text(widget.mail.content + '5555555555'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black54,
                    backgroundColor: Colors.black.withOpacity(0.06),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_return),
                  label: const Text('ตอบ'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black54,
                    backgroundColor: Colors.black.withOpacity(0.06),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.reply_all_outlined),
                  label: const Text('ตอบทุกคน'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black54,
                    backgroundColor: Colors.black.withOpacity(0.06),
                  ),
                  onPressed: () {},
                  icon: Transform(
                    transform: Matrix4.rotationY(pi),
                    alignment: Alignment.center,
                    child: const Icon(Icons.keyboard_return),
                  ),
                  label: const Text('ส่งต่อ'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
