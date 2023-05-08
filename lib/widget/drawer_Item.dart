import 'package:flutter/material.dart';

class MailboxWidget extends StatefulWidget {
  const MailboxWidget({
    Key? key,
    required this.icon,
    required this.index,
    required this.title,
    required this.selectedValue,
    required this.onTap, // add onTap callback parameter
  }) : super(key: key);

  final IconData icon;
  final int index;
  final String title;
  final int selectedValue;
  final Function() onTap; // declare onTap callback parameter

  @override
  // ignore: library_private_types_in_public_api
  _MailboxWidgetState createState() => _MailboxWidgetState();
}

class _MailboxWidgetState extends State<MailboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(   
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(30)),
        color:widget.selectedValue == widget.index ? const Color.fromARGB(255, 218, 217, 217) : null,
      ),
      child: ListTile(
        onTap: () {
          widget.onTap(); // call onTap callback
        },
        
        leading: Icon(
          widget.icon,
          color:  const Color.fromARGB(255, 67, 67, 67) ,
        ),
        title: Text(
          widget.title,
        ),
      ),
    );
  }
}
