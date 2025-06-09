import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bipbiip/main.dart';
import 'package:bipbiip/Busschedule.dart';
import 'package:lottie/lottie.dart';

class StopRequests extends StatelessWidget {
  const StopRequests({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.transparent,
        title: Text('Durak İstekleri'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //Color.fromRGBO(245, 101, 3, 1),
              Color.fromRGBO(211, 87, 3, 1),
              Color.fromRGBO(24, 28, 79, 1),
              Color.fromRGBO(14, 17, 53, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:Column(
          children: [
              Container(
                margin:EdgeInsets.only(right:15,top:40),
                child:Lottie.network('https://assets1.lottiefiles.com/packages/lf20_tmdnd8d1.json'),
              ),
            Container(
              margin: EdgeInsets.only(top:3,left:15,right:15),
              child:Container(

                decoration: BoxDecoration(
                  color:  Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),

                ),
                padding: EdgeInsets.all(13),
                child: Text(
                  '          Sabırsızlıkla beklediğini biliyoruz...\n Merak etme, en kısa sürede güncellemeyle eksikleri tamamlayacağız.',
                  style:TextStyle(
                      fontSize: 18,
                      height:2,
                      color:Colors.white70),
                ),
              ),),
          ],
        ),
      ),
    );
  }
}