import 'myUser.dart';
import 'myUser_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyUserList extends StatefulWidget {
  @override
  _MyUserListState createState() => _MyUserListState();
}

class _MyUserListState extends State<MyUserList> {
  @override
  Widget build(BuildContext context) {

    final myUsers = Provider.of<List<MyUser>>(context) ?? [];

    return ListView.builder(
      itemCount: myUsers.length,
      itemBuilder: (context, index) {
        return MyUserTile(myUser: myUsers[index]);
      },
    );
  }
}