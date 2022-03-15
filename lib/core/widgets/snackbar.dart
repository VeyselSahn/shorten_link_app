import 'package:flutter/material.dart';

void showSnacbar(BuildContext context,String text) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Text(
      text,
    ),
    backgroundColor: Colors.red,
  ));
}
