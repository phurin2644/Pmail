import 'package:flutter/material.dart';
import 'package:mail/models/mail.dart';
import 'package:mail/widget/mail_item.dart';

class MailList extends StatelessWidget {
  const MailList({
    super.key,
    required this.mails,
    required this.onRemoveMail,
  });

  final List<Mail> mails;
  final void Function(Mail expense) onRemoveMail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: mails.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(mails[index]),
          background: Container(
            color: const Color.fromARGB(255, 62, 141, 64),
            child: Row(
              children: const [
                SizedBox(
                  width: 25,
                ), // Add some space between the icon and the container
                Icon(
                  Icons.file_download_outlined,
                  color: Color.fromARGB(255, 57, 81, 57),
                  size: 30,
                ),
                
              ],
            ),
            // margin: EdgeInsets.symmetric(
            //   horizontal: Theme.of(context).cardTheme.margin!.horizontal
            // ),
          ),
          onDismissed: (direction) {
            onRemoveMail(mails[index]);
          },
          child: MailItem(mails[index]),
        ),
      ),
    );
  }
}
