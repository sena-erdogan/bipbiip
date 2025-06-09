import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bipbiip/comingbus.dart';
import 'package:bipbiip/notification_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class WaitingButton extends StatefulWidget{
  @override
  _WaitingButtonState createState()=> _WaitingButtonState();
}
class _WaitingButtonState extends State<WaitingButton> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState(){
    super.initState();
    NotificationApi.init();
    listenNotifications();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //onMessage:
      print("onMessage tetiklendi: $message");

    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onLaunch tetik: $message");
      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>comingbus(payload: '')));
      onClickedNotification('');
    });
  }
  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => comingbus(payload: payload),
      ));

  double _initial = 0.0;
  int number = 0;
  bool isPressed = false;
  bool isButtonActive = true;
  bool isButtonActive2 = false;
  final shape = StadiumBorder();
  void _myCallback(){
    setState(() {
      isPressed = true;
    });
  }

  Widget _stepIndicator(){
    String value = (number).toString();
    return Stack(
      children: [
        SizedBox(
          height: 30.0,
          child: LinearProgressIndicator(
            value: _initial,
            backgroundColor: Color.fromRGBO(171, 221, 244, 1),
            minHeight: 25.0,
            valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
          ),

        ),
        Align(child: Container(
            padding: EdgeInsets.all(8),
            child:Text("$value/10"), alignment: Alignment.center),
        ),
        Container(
          margin: EdgeInsets.only(top:50),
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    onSurface: Colors.white70,
                    backgroundColor: Color.fromRGBO(41, 155, 206, 1),
                  ),
                  onPressed: isButtonActive ? (){
                    setState((){
                      _initial = _initial + 0.1;
                      number = number+1;
                      isButtonActive = false;
                      isButtonActive2 = true;
                      if(number==10){
                        NotificationApi.showNotification(
                          title: 'Bekleme butonu',
                          body: 'Bekleyen sayısının 10 dan fazla olduğu durağa servis gönderildi.',
                          payload: '',
                        );
                       // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>comingbus(payload: 'value',)));
                      }
                    });
                  }
                      : null,
                  child:
                  Text("Bu durakta servis bekliyorum"),
                ),
                SizedBox(
                  height:20,
                ),
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    onSurface: Colors.white70,
                    backgroundColor: Color.fromRGBO(41, 155, 206, 1),
                  ),
                  onPressed: isButtonActive2 ? (){
                    setState((){
                      _initial = _initial - 0.1;
                      number = number-1;
                      isButtonActive2 = false;
                      isButtonActive = true;
                    });
                  }
                      : null,
                  child:
                  Text("Vazgeç"),
                ),
              ],
            ),
          ),
        ),
      ],

    );

  }
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
              margin: EdgeInsets.only(top:100,bottom: 55,left:9,right:9),
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
                  'Henüz servis saatine çok var ve servise binmek için bekliyorsanız butona basabilirsiniz.',
                  style:TextStyle(
                      fontSize: 18,
                      height:2,
                      color:Colors.white70),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children:[
                    _stepIndicator(),
                    //Lottie.network('https://assets3.lottiefiles.com/private_files/lf30_kms9of7r.json'),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10,bottom: 55,left:9,right:9),
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
                  'Bekleyen kişi sayısı 10 olduğunda bulunduğunuz durağa servis gönderilecektir.',
                  style:TextStyle(
                      fontSize: 18,
                      height:2,
                      color:Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}