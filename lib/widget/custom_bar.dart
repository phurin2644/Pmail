import 'package:flutter/material.dart';
import 'package:mail/widget/show_dialog.dart';

class CustomBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  const CustomBar({Key? key, required this.drawerKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(height: 9),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(180, 235, 228, 228),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              drawerKey.currentState!.openDrawer();
                            },
                            child: const Icon(
                              Icons.menu,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Material(
                              color: Colors.transparent,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'ค้นหาในอีเมล',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: RawMaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const ShowDialog(),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 17,
                          backgroundColor: Color.fromARGB(255, 31, 145, 122),
                          child: Text(
                            'P',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
