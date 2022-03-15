import 'package:flutter/material.dart';
import 'package:grisoft/core/provider/links_provider.dart';
import 'package:grisoft/screen/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LinksProvider(),
        child: const MaterialApp(title: 'Material App', debugShowCheckedModeBanner: false, home: MainScreen()));
  }
}
