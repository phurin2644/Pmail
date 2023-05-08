import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  SendMail({super.key});
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
            icon: const Icon(Icons.attachment_outlined),
            iconSize: 24,
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
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
        child: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 12),
                  child: Text(
                    'จาก',
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                ),
                hintText: 'phus.2644@gmail.com',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.expand_more),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 12),
                  child: Text(
                    'ถึง',
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                ),
              
                suffixIcon: IconButton(
                  icon: const Icon(Icons.expand_more),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 12),
                  child: Text(
                    'เรื่อง',
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                ),
                
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 12),
                  child: Text(
                    'เขียนอีเมล',
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                ),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            )
          ],),
        ),
      ),
    );
  }
}
