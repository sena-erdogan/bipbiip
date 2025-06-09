import 'package:bipbiip/administrationscreen.dart';
import 'package:bipbiip/studentscreen.dart';
import 'package:flutter/material.dart';
import 'settingspage.dart';
import 'package:bipbiip/timerback.dart';
import 'package:bipbiip/Mapscreen.dart';
import 'package:bipbiip/Busschedule.dart';
import 'package:bipbiip/CircularFabWidget.dart';

class NotificationsSupervisor extends StatefulWidget{

  NotificationsSupervisor({Key? key}) : super(key: key);

  @override
  _NotificationsSupervisorState createState() => _NotificationsSupervisorState();
}

class _NotificationsSupervisorState extends State<NotificationsSupervisor> {

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
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AdministrationScreen()));
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>NotificationsSupervisor()));
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
      ),
    ),
  );

}
