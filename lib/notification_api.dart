import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> myBackgroundMessageHandler(Map<String, dynamic> message){
  if(message.containsKey('data')){
    final dynamic data = message['data'];
    print("Arka planda gelen data" + message["data"].toString());
    NotificationApi.showNotification();
  }
  return Future<void>.value();
}
class NotificationApi{
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async{
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,

      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initScheduled = false}) async{
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS= IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS:iOS);

    //when app is closed
    final details = await _notifications.getNotificationAppLaunchDetails();
    if(details != null && details.didNotificationLaunchApp){
      onNotifications.add(details.payload);
    }
    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
      },
    );

    /*FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //onMessage:
      print("onMessage tetiklendi: $message");
      showNotification();

    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onLaunch tetik: $message");
    });*/
    if(initScheduled){
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }


  static Future showNotification({
    int id=0,
    String? title,
    String? body,
    String? payload,

  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );

  static void showScheduledNotification({
    int id=0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledData,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
       _scheduleWeekly(Time(19,30), days: [DateTime.monday, DateTime.tuesday]),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );

      static tz.TZDateTime _scheduleDaily(Time time) {
        final now = tz.TZDateTime.now(tz.local);
        final scheduledDate = tz.TZDateTime(
          tz.local,
          now.year,
          now.month,
          now.day,
          time.hour,
          time.second
        );

        return scheduledDate.isBefore(now)
            ? scheduledDate.add(Duration(days: 1))
            : scheduledDate;
      }

      static tz.TZDateTime _scheduleWeekly(Time time, {required List<int> days}){
        tz.TZDateTime scheduledDate =_scheduleDaily(time);

        while(!days.contains(scheduledDate.weekday)){
          scheduledDate = scheduledDate.add(Duration(days:1));
        }

        return scheduledDate;
      }
}