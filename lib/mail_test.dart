import 'package:flutter/material.dart';
import 'package:mail/models/mail.dart';

class MailItem extends StatelessWidget {
  const MailItem(this.mail, {super.key});

  final Mail mail;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        //card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          // color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: mail.color,
              radius: 21.5,
              child: Text(
                mail.title.substring(0, 1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              //content
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    //title and time
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          mail.title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: mail.isRead
                                ? FontWeight.normal
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '22.46',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight:
                              mail.isRead ? FontWeight.normal : FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Text(
                    mail.description,
                    style: TextStyle(
                      fontWeight:
                          mail.isRead ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(mail.content),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.grade_outlined,
                            size: 25,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class CustomBar extends StatelessWidget {
//   final GlobalKey<ScaffoldState> drawerKey;

//   const CustomBar({Key? key, required this.drawerKey}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return Column(
//       children: [
//         const SizedBox(height: 9),
//         Padding(
//           padding: const EdgeInsets.only(left: 15, right: 15),
//           child: Column(
//             children: [
//               Container(
//                 width: size.width,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   color: const Color.fromARGB(180, 235, 228, 228),
//                 ),
//                 child: RawMaterialButton(
//                   onPressed: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 10, left: 17),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   drawerKey.currentState!.openDrawer();
//                                 },
//                                 child: const Icon(
//                                   Icons.menu,
//                                   size: 30,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               const Text(
//                                 'ค้นหาในอีเมล',
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 40,
//                           child: RawMaterialButton(
//                             onPressed: () {
//                               // Add your code here
//                               // showDialog(
//                               //     context: context,
//                               //     builder: (context) => AlertDialog(

//                               //           content: AppBar(title: Text('mail'),),
//                               //         ));
//                             },
//                             child: const CircleAvatar(
//                               radius: 17,
//                               backgroundColor:
//                                   Color.fromARGB(255, 31, 145, 122),
//                               child: Text(
//                                 'P',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


