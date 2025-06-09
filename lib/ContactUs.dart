import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bipbiip/main.dart';
import 'package:lottie/lottie.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.transparent,
        title: Text('Bizimle iletişim kur'),
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
        child: Column(
          children: [

            Container(
            margin: EdgeInsets.only(top:100,bottom: 0,left:10,right:10),
            child:Container(

              decoration: BoxDecoration(
                color:  Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),

              ),
              padding: EdgeInsets.all(13),
              child: Text(
                'Bir sorun mu var? Merak etme BİZ yanındayız.',
                style:TextStyle(
                    fontSize: 18,
                    height:2,
                    color:Colors.white70),
              ),
            ),),
            Container(
              margin:EdgeInsets.only(top:0),
              width:210,
              height:210,
              child:Lottie.network('https://assets7.lottiefiles.com/packages/lf20_cdo32tuu.json'),
            ),
            Container(
              margin: EdgeInsets.only(top:2,bottom: 8,left:10,right:10),
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
                padding: EdgeInsets.all(13),
                child: Text(
                  'Yardıma ihtiyacın varsa ya da istek ve şikayetlerin için bizimle aşağıdaki adresten iletişime geçebilirsin.',
                  style:TextStyle(
                      fontSize: 18,
                      height:2,
                      color:Colors.white70),
                ),
              ),),
            Container(
              margin: EdgeInsets.only(top:2,bottom: 20,left:10,right:10),
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
                padding: EdgeInsets.all(13),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Icon(Icons.email_outlined,color:Colors.white70,size:40),
                  Text(
                  'deadbugssociety.bipbiip@gmail.com',
                  style:TextStyle(
                      fontSize: 18,
                      height:2,
                      color:Colors.white70),
                ),],
              ),),),
          ],
        ),
      ),
    );
  }
}