import 'dart:async';
import 'package:bipbiip/notification_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bipbiip/button_widget.dart';

class TimerBack extends StatefulWidget{

  final int value;

  const TimerBack({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  _TimerBackState createState()=> _TimerBackState();
}
class _TimerBackState extends State<TimerBack> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static const maxSeconds=180;
  late int seconds = widget.value;
  Timer? timer;
  bool isButtonActive = true;
  int number = 0;
  int n =0;
  void startTimer() {

    timer=Timer.periodic(Duration(seconds:1),(_){
      if(seconds>0) {
        setState(() {
          seconds--;
        });
      }else{
        stopTimer(reset:false);
      }
    });
  }
  void resetTimer()=>setState(() => seconds = maxSeconds);
  void stopTimer({bool reset=true}){
    if(reset){
      resetTimer();
    }
    setState(() => timer?.cancel());
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: Text('Servise Yakınım Butonu'),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop(seconds);

          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
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
              margin: EdgeInsets.only(top:100,bottom: 55,left:10,right:10),
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
                padding: EdgeInsets.all(15),
                child: Text(
                  'Servis bu butona bastığınızdan itibaren 3 dakika bekleyecek.',
                  style:TextStyle(
                      fontSize: 18,
                      height:2,
                      color:Colors.white70),
                ),
              ),
            ),
            Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  buildTimer(),
                  const SizedBox(height:50),
                  buildButtons(),
                ],
              ),
            ),
          ],
        ),

      ),
    );

  }
  Widget buildButtons(){
    if(widget.value!=180){
      startTimer();
      isButtonActive=false;
      n = 1;
    }
    return
      Container(
      margin: EdgeInsets.only(bottom:20),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: OutlinedButton.styleFrom(
             fixedSize: Size(200,60),
              onSurface: Colors.white70,
              backgroundColor: Color.fromRGBO(41, 155, 206, 1),
            ),
            onPressed: isButtonActive ? (){
              setState((){
                number = number+1;
                isButtonActive = false;
                if(number==1){
                  NotificationApi.showNotification(
                    title: 'Acele et!',
                    body: 'Servis 3 dakika geç kalkacak.',
                    payload: '180',
                  );
                  if(n==0){
                  startTimer();}
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>comingbus(payload: 'value',)));
                }
              });
            }
                : null,
            child:
            Text("Servise Yakınım!",style: TextStyle(fontSize: 22),),
          ),
          /*ButtonWidget(
            text: 'Servise yakınım!',
            backgroundColor:Color.fromRGBO(41, 155, 206, 1),
            onClicked: () {

              NotificationApi.showNotification(
                title: 'Acele et!',
                body: 'Servis 3 dakika geç kalkacak.',
                payload: '180',
              );
              startTimer();
            },
          ),*/
          /*Container(
            margin: EdgeInsets.only(top:20),
            child:ButtonWidget(
              text: 'Vazgeç',
              backgroundColor:Color.fromRGBO(41, 155, 206, 1),
              onClicked: () {
                stopTimer();
              },
            ),
          )*/
        ],
      ),
    );
  }

  Widget buildTimer() =>SizedBox(
    width: 200,
    height: 200,
    child:
    Stack(
      fit:StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: 1 - seconds/maxSeconds,
          valueColor: AlwaysStoppedAnimation(Colors.white),
          strokeWidth: 12,
          backgroundColor: Color.fromRGBO(245,101, 3, 0.7),
        ),
        Center(child:buildTime()),
      ],
    ),
  );
  Widget buildTime(){
    return Text(
      '$seconds',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 70,
      ),
    );
  }

}
