import 'dart:async';

import 'package:flutter/material.dart';
import 'package:usero/constants/constant_texts.dart';

class HomeScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:AppBarText() ,
    );
  }
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
class AppBarText extends StatefulWidget {
  AppBarText({Key? key}) : super(key: key);
  @override
  State<AppBarText> createState() => _AppBarTextState();
}

class _AppBarTextState extends State<AppBarText> {
  @override
  late var hour; 
  String content = "";
  @override
  void initState() {
    super.initState();
    hour = DateTime.now().hour;
    if (hour < 12 ){
      content = kMorning;
    }
    else if(hour<17){
      content = kAfternoon;
    }
    else content = kEvening;
  }
  Widget build(BuildContext context) {
    return Text(content);

  }
}
