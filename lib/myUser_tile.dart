import 'myUser.dart';
import 'package:flutter/material.dart';

class MyUserTile extends StatelessWidget {

  final MyUser? myUser;
  MyUserTile({ this.myUser });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(myUser!.name!),
        ),
      ),
    );
  }
}