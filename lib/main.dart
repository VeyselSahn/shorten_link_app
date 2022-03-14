import 'package:flutter/material.dart';
import 'package:grisoft/screen/main_screen/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', debugShowCheckedModeBanner: false, home: MainScreen());
  }
}
