import 'dart:async';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget{

  final MyAppState myAppState=new MyAppState();
  @override
  MyAppState createState() => MyAppState();
  void startTimer(){
    myAppState.startTimer();
  }

}

class MyAppState extends State<MyWidget>{
  static const maxSeconds=60;
  int seconds = maxSeconds;
  Timer? timer;
  Widget build(BuildContext context){

    return Text(
      '$seconds',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 80,
      ),
    );
  }
  void startTimer() {
    timer=Timer.periodic(Duration(seconds:1),(_){
      setState(() {
        seconds--;
      });
    });
  }
}