import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: const Text("Hakkımızda", style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal)),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //Color.fromRGBO(245, 101, 3, 1),
              Color.fromRGBO(211, 87, 3, 1),
              Color.fromRGBO(24, 28, 79, 1),
              Color.fromRGBO(14, 17,53, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:Padding(
        padding: EdgeInsets.symmetric(vertical: 180.0, horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "BipBiip",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            SizedBox(height: 3.0),
            Center(
              child: Text(
                "Version 1.0.0.1 (Beta)",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/bipbiip.jpeg"),
                radius: 85.0,
              ),
            ),
            SizedBox(height: 15.0),
            Center(
              child: Text(
                "© 2021 DeadBugsSociety",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

