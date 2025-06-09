import 'package:bipbiip/WriteNotification.dart';
import 'package:bipbiip/notification_api.dart';
import 'package:bipbiip/studentscreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'settingspage.dart';
import 'package:bipbiip/timerback.dart';
import 'package:bipbiip/Mapscreen.dart';
import 'package:bipbiip/Busschedule.dart';
import 'package:bipbiip/CircularFabWidget.dart';

class PushNotification {
  PushNotification({
    this.title,
    this.body,
    this.dataTitle,
    this.dataBody,
  });

  String? title;
  String? body;
  String? dataTitle;
  String? dataBody;
}

class Notifications extends StatefulWidget{

  Notifications({Key? key, String? payload}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  PushNotification? _notificationInfo;
  @override
  void initState(){
    super.initState();

    NotificationApi.init(initScheduled: true);
    listenNotifications();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      setState(() {
        _notificationInfo = notification;

      });});
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onLaunch tetik: $message");
      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>comingbus(payload: '')));
      onClickedNotification('');
    });

    NotificationApi.showScheduledNotification(
      title: 'Servis Ücreti',
      body: 'Günaydın, bu ay ki servis ücreti ödemeleri başlamıştır',
      payload: 'Günaydın, bu ay ki servis ücreti ödemeleri başlamıştır',
      scheduledData: DateTime.now().add(Duration(seconds:12)),
    );

  }
  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Notifications(payload: payload),
      ));

  @override
  Widget build(BuildContext context) =>DefaultTabController(
    length:2,
    child:Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: Text("Bildirimler"),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>StudentScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        bottom: TabBar(
          padding:EdgeInsets.only(top:0.01),
          indicatorColor: Color.fromRGBO(211, 87, 3, 0.1),
          indicatorWeight: 0.1,
          indicatorPadding: EdgeInsets.zero,
          tabs: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>StudentScreen()));
              },
              style: OutlinedButton.styleFrom(
                elevation:0,
                side: BorderSide(width:0.0, color:Color.fromRGBO(211, 87, 3, 0.05)),
                fixedSize: Size(120,50),
                backgroundColor:  Color.fromRGBO(211, 87, 3, 0),
                //padding: EdgeInsets.only(top:0.05, bottom:0.05),
              ),
              child:Tab(icon:Icon(Icons.home),text:'Anasayfa',
                iconMargin: EdgeInsets.only(bottom:0.02, top:0.02),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                NotificationApi.showScheduledNotification(
                  title: 'Servis Ücreti',
                  body: 'Günaydın, bu ay ki servis ücreti ödemeleri başlamıştır',
                  payload: 'Günaydın, bu ay ki servis ücreti ödemeleri başlamıştır',
                  scheduledData: DateTime.now().add(Duration(seconds:12)),
                );
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Notifications()));
              },
              style: OutlinedButton.styleFrom(
                elevation:0,
                side: BorderSide(width:0.0, color:Color.fromRGBO(211, 87, 3, 0.05)),
                fixedSize: Size(120,50),
                backgroundColor:  Color.fromRGBO(211, 87, 3, 0),
                //padding: EdgeInsets.only(top:0.05, bottom:0.05),
              ),
              child:Tab(icon:Icon(Icons.notifications_none),text:'Bildirimler',
                iconMargin: EdgeInsets.only(bottom:0.02, top:0.02),
              ),
            ),
          ],
        ),
      ),
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
        child:Column(
          children: [
            _notificationInfo != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TITLE: ${_notificationInfo!.title}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'BODY: ${_notificationInfo!.body}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
                : Container(),
          ],),
        /*Text(
          'BODY: ${_notificationInfo!.dataBody ?? _notificationInfo!.body}',
          // ...
        ),*/
      ),
  ),
  );

}
