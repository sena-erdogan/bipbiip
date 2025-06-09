import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class comingbus extends StatelessWidget {
  final String? payload;

  const comingbus({
    Key? key,
    required this.payload,
  }) : super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.transparent,
        title: Text(
          'Bekleme Butonu',
        ),
        centerTitle: true,
      ),
      body:
      Container(
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
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top:150,bottom: 55,left:9,right:9),
              child:Container(

                decoration: BoxDecoration(
                  color:  Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),

                ),
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 15.0, top: 15.0),
                child: Text(
                  'Beklediğiniz durağa servis gönderildi. ',
                  style:TextStyle(
                      fontSize: 18,
                      height:2,
                      color:Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height:50,
            ),
            Center(
              child:Lottie.network('https://assets3.lottiefiles.com/packages/lf20_eV3CKA.json'),
            ),
          ],
        ),
      ),
    );
  }
}