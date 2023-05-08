import 'package:flutter/material.dart';
import 'package:mail/mails.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: const Mails(),
  ));
}
