import 'package:flutter/material.dart';
import 'package:mail/mail_test.dart';
import 'package:mail/widget/custom_bar.dart';
import 'package:mail/widget/drawer_Item.dart';
import 'package:mail/widget/mail_list.dart';
import 'package:mail/models/mail.dart';
import 'package:mail/widget/send_mail.dart';

class Mails extends StatefulWidget {
  const Mails({super.key});

  @override
  State<Mails> createState() {
    return _MailsState();
  }
}

class _MailsState extends State<Mails> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  int _counterselect = 1;
  int _selectedIndex = 0;

  void _setCounter(int value) {
    setState(() {
      _counterselect = value;
    });
    Navigator.pop(context);
  }

  final List<Mail> _registerMails = [
    Mail(
      title: 'Masaki',
      date: DateTime.now(),
      description: 'This mail is form Masaki',
      content: 'I love you. Can you marry me?',
      isRead: false,
      color: Colors.amber.shade400,
    ),
    Mail(
      title: 'Aree',
      date: DateTime.now(),
      description: 'This mail is form Aree',
      content: 'I love you. Can you marry me?',
      isRead: false,
      color: Colors.deepOrange.shade600,
    ),
    Mail(
      title: 'Peem',
      date: DateTime.now(),
      description: 'This mail is form Peem',
      content: 'I love you. Can you marry me?',
      isRead: true,
      color: Colors.brown,
    ),
    Mail(
      title: 'Bank',
      date: DateTime.now(),
      description: 'This mail is form Bank',
      content: 'I love you. Can you marry me?',
      isRead: true,
      color: Colors.green,
    ),
    Mail(
      title: 'Tee',
      date: DateTime.now(),
      description: 'This mail is form Tee',
      content: 'I love you. Can you marry me?',
      isRead: false,
      color: Colors.amberAccent.shade700,
    ),
    Mail(
      title: 'Name',
      date: DateTime.now(),
      description: 'This mail is form Name',
      content: 'I love you. Can you marry me?',
      isRead: false,
      color: Colors.cyan.shade700,
    ),
    Mail(
      title: 'Zen',
      date: DateTime.now(),
      description: 'This mail is form Zen',
      content: 'I love you. Can you marry me?',
      isRead: false,
      color: Colors.deepPurple.shade400,
    ),
    Mail(
      title: 'Phurin',
      date: DateTime.now(),
      description: 'This mail is form Phurin',
      content: 'I love you. Can you marry me?',
      isRead: false,
      color: const Color.fromARGB(255, 31, 145, 122),
    ),
    Mail(
      title: 'Masaki',
      date: DateTime.now(),
      description: 'This mail is form Masaki',
      content: 'I love you. Can you marry me?',
      isRead: false,
      color: Colors.amber.shade400,
    ),
    Mail(
      title: 'Aree',
      date: DateTime.now(),
      description: 'This mail is form Aree',
      content: 'I love you. Can you marry me?',
      isRead: false,
      color: Colors.deepOrange.shade600,
    ),
    Mail(
      title: 'Peem',
      date: DateTime.now(),
      description: 'This mail is form Peem',
      content: 'I love you. Can you marry me?',
      isRead: true,
      color: Colors.brown,
    ),
  ];

  void _removeExpens(Mail mail) {
    final expensrIndex = _registerMails.indexOf(mail);
    setState(() {
      _registerMails.remove(mail);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('เก็บ 1 รายการ'),
        action: SnackBarAction(
          label: 'เลิกทำ',
          onPressed: () {
            setState(() {
              _registerMails.insert(expensrIndex, mail);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget mainContent = const Center(
      child: Text('No mail found. Start adding some!'),
    );

    if (_counterselect == 1) {
      if (_registerMails.isNotEmpty) {
        mainContent = MailList(
          mails: _registerMails,
          onRemoveMail: _removeExpens,
        );
      }
    }

    if (_counterselect == 4) {
      List<Mail> selectedmail =
          _registerMails.where((mail) => mail.isStar).toList();
      if (selectedmail.isNotEmpty) {
        mainContent =
            MailList(mails: selectedmail, onRemoveMail: _removeExpens);
      }
    }

    if (_counterselect == 13) {
      List<Mail> selectedmail =
          _registerMails.where((mail) => mail.isDelete).toList();
      if (selectedmail.isNotEmpty) {
        mainContent =
            MailList(mails: selectedmail, onRemoveMail: _removeExpens);
      }
    }

    if (_counterselect == 0) {
      if (_registerMails.isNotEmpty) {
        mainContent = MailList(
          mails: _registerMails,
          onRemoveMail: _removeExpens,
        );
      }
    }

    return Scaffold(
      key: _drawerkey,
      drawer: SafeArea(
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const SizedBox(
                height: 80,
                child: DrawerHeader(
                  child: Text(
                    'Pmail',
                    style: TextStyle(
                      color: Color.fromARGB(255, 244, 53, 28),
                      // fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              MailboxWidget(
                icon: Icons.all_inbox,
                index: 0,
                title: 'กล่องจดหมายทั้งหมด',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(0); // update _counterselect
                },
              ),
              // DrawerItem(Icons.all_inbox, 'sssss', 0),

              const Divider(),
              MailboxWidget(
                icon: Icons.inbox,
                index: 1,
                title: 'หลัก',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(1); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.sell_outlined,
                index: 2,
                title: 'โปรโมชัน',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(2); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.group_outlined,
                index: 3,
                title: 'โซเซียล',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(3); // update _counterselect
                },
              ),
              const SizedBox(
                height: 20,
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 15),
                  child: Text('ป้ายกำกับทั้งหมด'),
                ),
              ),
              MailboxWidget(
                icon: Icons.grade_outlined,
                index: 4,
                title: 'ติดดาว',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(4); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.label_important_outline,
                index: 5,
                title: 'สำคัญ',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(5); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.schedule_outlined,
                index: 6,
                title: 'เลื่อนการแจ้งเตือน',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(6); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.send_outlined,
                index: 7,
                title: 'ส่งแล้ว',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(7); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.schedule_send_outlined,
                index: 8,
                title: 'กำหนดเวลา',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(8); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.note,
                index: 9,
                title: 'กล่องจดหมายออก',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(9); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.note_outlined,
                index: 10,
                title: 'ร่างจดหมาย',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(10); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.mail_outlined,
                index: 11,
                title: 'อีเมลทั้งหมด',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(11); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.report_gmailerrorred_outlined,
                index: 12,
                title: 'จดหมายขยะ',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(12); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.restore_from_trash,
                index: 13,
                title: 'ถังขยะ',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(13); // update _counterselect
                },
              ),
              const SizedBox(
                height: 20,
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 15),
                  child: Text('แอป Google'),
                ),
              ),
              MailboxWidget(
                icon: Icons.calendar_today_rounded,
                index: 14,
                title: 'ปฏิทิน',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(14); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.account_circle_outlined,
                index: 15,
                title: 'รายชื่อติดต่อ',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(15); // update _counterselect
                },
              ),
              const Divider(),
              MailboxWidget(
                icon: Icons.settings_outlined,
                index: 16,
                title: 'การตั้งค่า',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(16); // update _counterselect
                },
              ),
              MailboxWidget(
                icon: Icons.announcement_outlined,
                index: 17,
                title: 'ความช่วยเหลือและความคิดเห็น',
                selectedValue: _counterselect,
                onTap: () {
                  _setCounter(17); // update _counterselect
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBar(drawerKey: _drawerkey),
            const Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 0.0, 5.0),
              child: SizedBox(
                child: Text('หลัก'),
              ),
            ),
            Expanded(child: mainContent),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SendMail(),
          );
        },
        label: const Text('เขียน', style: TextStyle(color: Colors.black)),
        icon: const Icon(Icons.create_outlined, color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 235, 228, 228),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromARGB(255, 235, 228, 228),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_outlined, size: 25),
            label: 'videocam',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 43, 42, 42),
        onTap: (int index) {
          switch (index) {
            case 0:
              // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                mainContent;
              }
              break;
            case 1:
              mainContent;
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
