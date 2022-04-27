import 'package:flutter/material.dart';
import 'package:usero/api/network_manager.dart';
import 'package:usero/models/post_model.dart';


class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  late final INetworkManager _networkManager;
  List<PostModel?> _users = [];
  @override
  void initState() {
    super.initState();
    _networkManager = NetworkManager();
    _fetchUserInfo();
  }
  Future <void> _fetchUserInfo() async{
    late PostModel? post;
    for(int i = 0; i< 15;i++){
      post = await _networkManager.fetchUserInfo();
      _users.add(post);
    }
  }
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context,int index){
          return Card(
            child: Image(image: NetworkImage(_users[index]?.results?.first.picture?.medium ?? "https://static.remove.bg/remove-bg-web/a8b5118d623a6b3f4b7813a78c686de384352145/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png")),
          );
        },
      ),
    );
  }
}