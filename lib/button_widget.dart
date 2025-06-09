import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final String text;
  final Color backgroundColor;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.backgroundColor=Colors.blue,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    bool isButtonActive = true;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16)
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),

      onPressed:
      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Clockpage()));
      onClicked,






    );
  }
}