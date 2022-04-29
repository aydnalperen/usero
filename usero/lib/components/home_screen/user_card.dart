import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  late String imageUrl;
  late String userName;
  late String name;
  late int followerNumber;
  late int uploadNumber;
  UserCard({required this.imageUrl,required this.userName,required this.name,required this.followerNumber, required this.uploadNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image(image: NetworkImage(imageUrl)),
          Column(
            children: [
              Text(userName),
              Text(name),
            ],
          ),
          Text(followerNumber.toString()),
          Text(uploadNumber.toString())
        ],
      ),
    );
  }
}