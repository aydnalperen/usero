import 'package:flutter/material.dart';
import 'package:usero/views/home_view.dart';

void main() => runApp(UseroApp());

class UseroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}