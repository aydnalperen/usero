import 'dart:math';

import 'package:flutter/material.dart';
import 'package:usero/models/post_model.dart';
import 'package:usero/constants/constant_texts.dart';
class UserCard extends StatelessWidget {
  late PostModel user;
  UserCard({required this.user});

  

  @override
  Widget build(BuildContext context) {
    final String  imageUrl =user.results?[0].picture?.large ?? "alperen"; 
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0
      ),
      child:Stack(
        children: [
          InfoCard(user: user,),
          UserImage(imageUrl: imageUrl),
          
        ],
      ),
    );
  }
}

class UserImage extends StatelessWidget {
  late String imageUrl;
  UserImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: CircleAvatar(
            backgroundImage:NetworkImage(imageUrl),
            radius: 50,
          ),
    );
  }
}
class InfoCard extends StatelessWidget {
  late PostModel user;
  InfoCard({required this.user});
  final _random = Random();  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.0,
      margin: const EdgeInsets.only(left: 46.0),
      decoration:BoxDecoration(
        color: kColors[_random.nextInt(kColors.length)],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.results?.first.name?.first ?? "No Data!",style: kTextStyle,),
              Text(user.results?.first.name?.last ?? "No Data!")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Title:"),
              Text(user.results?.first.name?.title ?? "No Data!")
            ],
          ),
          Text(user.results?.first.email ?? "No Data!")
        ],
      ),
    );
  }
}