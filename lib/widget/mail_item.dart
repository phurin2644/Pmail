import 'package:flutter/material.dart';
import 'package:mail/models/mail.dart';
import 'package:mail/widget/mail_detail.dart';

class MailItem extends StatefulWidget {
  const MailItem(this.mail, {Key? key}) : super(key: key);

  final Mail mail;

  @override
  _MailItemState createState() => _MailItemState();
}

class _MailItemState extends State<MailItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => MailDetail(widget.mail),
        );
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // do something when the CircleAvatar is pressed
                },
                child: CircleAvatar(
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
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.mail.title,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: widget.mail.isRead
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '22.46',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: widget.mail.isRead
                                ? FontWeight.normal
                                : FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.mail.description,
                      style: TextStyle(
                        fontWeight: widget.mail.isRead
                            ? FontWeight.normal
                            : FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(widget.mail.content),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.mail.isStar = !widget.mail.isStar;
                            });
                          },
                          child: Icon(
                            widget.mail.isStar
                                ? Icons.grade
                                : Icons.grade_outlined,
                            size: 26,
                            color: widget.mail.isStar
                                ? Colors.brown.shade400
                                : const Color.fromARGB(255, 117, 117, 117),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
