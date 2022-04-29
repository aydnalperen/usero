import 'package:flutter/material.dart';
import 'package:usero/api/network_manager.dart';
import 'package:usero/components/home_screen/user_card.dart';
import 'package:usero/models/post_model.dart';


class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late final INetworkManager _networkManager;
  List<PostModel?> _users = [];
  @override
  void initState() {
    super.initState();
    
    setState(() {
      _networkManager = NetworkManager();
      _fetchUserInfo();
    });
  }
  Future <void> _fetchUserInfo() async{
    late PostModel? post;
    for(int i = 0; i< 15;i++){
      post = await _networkManager.fetchUserInfo();
      _users.add(post);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context,int index){
          return UserCard(
              imageUrl: _users[index]?.results?.first.picture?.medium ?? "alpern",
              userName: _users[index]?.results?.first.gender ?? "alperen", 
              name: _users[index]?.results?.first.name?.first ?? "alperen", 
              followerNumber:  12, 
              uploadNumber: 4000
            );
        },
      ),
    );
  }
}