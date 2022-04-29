import 'package:flutter/material.dart';
import 'package:usero/components/home_screen/home_screen_appbar.dart';
import 'package:usero/components/home_screen/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      body: HomeScreenBody(),
      );
    
  }
}