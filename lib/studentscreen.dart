import 'dart:ffi';

import 'package:bipbiip/Notifications.dart';
import 'package:bipbiip/UserType.dart';
import 'package:bipbiip/bustracking.dart';
import 'package:bipbiip/notification_api.dart';
import 'package:bipbiip/paymentconfirm.dart';
import 'package:flutter/material.dart';
import 'StudentPaymentScreen.dart';
import 'settingspage.dart';
import 'package:bipbiip/timerback.dart';
import 'package:bipbiip/Mapscreen.dart';
import 'package:bipbiip/Busschedule.dart';
import 'package:bipbiip/CircularFabWidget.dart';
import 'dart:async';
import 'homepage.dart';
import 'auth.dart';
import 'loading.dart';
import 'dart:io';

class StudentScreen extends StatefulWidget{
  StudentScreen({Key? key}) : super(key: key);

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  int value = 180;
  int num = 0;
  Timer? timer;
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) =>DefaultTabController(
    length:2,
    child:Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: const Text(
            "Öğrenci Ana Sayfa", style: TextStyle(fontSize: 22)),
        leading: IconButton(
          onPressed: ()=> exit(0),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Çıkış yap'),
            onPressed: () async {
              setState(() => loading = true);
              dynamic result = await _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
        ],
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
              /*ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>TimerBack()));
                },
                style: OutlinedButton.styleFrom(
                  elevation:0,
                  side: BorderSide(width:0.0, color:Color.fromRGBO(211, 87, 3, 0.05)),
                  fixedSize: Size(120,50),
                  backgroundColor:  Color.fromRGBO(211, 87, 3, 0),
                  //padding: EdgeInsets.only(top:0.05, bottom:0.05),
                ),
                child:Tab(icon:Icon(Icons.person),text:'Profil',
                  iconMargin: EdgeInsets.only(bottom:0.02, top:0.02),
                ),
              ),*/
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

            child: Column(
              children: [

               Container(
                //margin: EdgeInsets.only(left:10),
                  child:Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Container(
                      child:Column(
                        children: [
                    //margin: EdgeInsets.only(top:70),
                      Container(
                        margin:EdgeInsets.only(top:150,left:40),
                        child:ElevatedButton(
                          child:Column(
                            children: [
                              Icon(Icons.location_on_outlined,size:50),
                              Text('Duraklar',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                            ],
                          ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 87, 34, 0.8),
                      padding: EdgeInsets.only(top:15),
                      fixedSize: Size(180,110),
                      //minimumSize:Size(180.0, 180.0),
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen()));
                    },
                    //child:Text("Duraklar"),
                  ),),
                          Container(
                            margin:EdgeInsets.only(left:10,top:20,bottom:20),
                            child:ElevatedButton(
                              child:Column(
                                children: [
                                  Icon(Icons.departure_board_outlined,size:40),
                                  Text('Servis Saatleri',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                padding:EdgeInsets.only(top:15),
                                primary: Color.fromRGBO(255, 87, 34, 0.8),
                                //minimumSize:Size(180.0, 180.0),
                                fixedSize: Size(220,100),
                                shape: RoundedRectangleBorder( //to set border radius to button
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>buschedule()));
                              },
                              //child:Text("Servis Saatleri"),
                            ),
                          ),
                          Container(
                            margin:EdgeInsets.only(left:10),
                            child: ElevatedButton(
                              child:Column(
                                children: [
                                  Icon(Icons.near_me_outlined,size:50),
                                  Text('Servis Takip',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary:Color.fromRGBO(255, 87, 34, 0.8),
                                padding:EdgeInsets.only(top:50),
                                //minimumSize:Size(180.0, 180.0),
                                fixedSize: Size(130,200),
                                shape: RoundedRectangleBorder( //to set border radius to button
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>bustracking()));
                              },
                              //child:Text("Servis Takip"),
                            ),
                          ),
                        ],),),
                    Container(
                      margin:EdgeInsets.only(top:100),
                      child:Column(
                        children: [
                    Container(
                      //margin: EdgeInsets.only(top:150),
                      child:ElevatedButton(
                        child:Column(
                          children: [
                          Icon(Icons.directions_run,size:50),
                          Text('Servise Yakınım',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      style: ElevatedButton.styleFrom(
                        padding:EdgeInsets.only(top:50),
                      primary: Color.fromRGBO(255, 87, 34, 0.8),
                      //minimumSize:Size(180.0, 180.0),
                        fixedSize: Size(130,200),
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    onPressed: () async {
                          final newValue =
                         await Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimerBack(value:value),));
                          setState(() => this.value = newValue);
                        timer=Timer.periodic(Duration(seconds:1),(_){
                        if(value>0) {
                          setState(() {
                            value--;
                          });
                        }
                        if(value==0 && num==0){
                          NotificationApi.showNotification(
                            title: 'Heyy!!',
                            body: 'Servis yola çıktı.',
                            payload: '180',
                          );
                          num=1;
                        }
                        });
                          }
                    //child:Text("Servise Yakınım"),
                  ),),
                          Container(
                            margin: EdgeInsets.only(top:20,right:20),
                            child:ElevatedButton(
                              child:Column(
                                children: [
                                  Icon(Icons.article_outlined,size:50),
                                  Text('Ödeme Bilgileri',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(255, 87, 34, 0.8),
                                padding:EdgeInsets.only(top: 15),
                                //minimumSize:Size(180.0, 180.0),
                                fixedSize: Size(160,110),
                                shape: RoundedRectangleBorder( //to set border radius to button
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentInfoUI()));
                              },
                              //child:Text("Ödeme Bilgileri"),
                            ),
                          ),
                   ],
                ),),],),),
                /*Container(

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                   /* Container(
                      margin:EdgeInsets.only(bottom:10),
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                      //minimumSize:Size(180.0, 180.0),
                        fixedSize: Size(160,100),
                        shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen()));
                      },
                      child:Text("Servis Saatleri"),
                    ),
                  ),*/
                    Container(
                      margin: EdgeInsets.only(top:20),
                      child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      //minimumSize:Size(180.0, 180.0),
                        fixedSize: Size(130,80),
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen()));
                      },
                      child:Text("Servise yakınım"),
                    ),
                ),],),),*/
                /*Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      //minimumSize:Size(180.0, 180.0),
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen()));
                    },
                    child:Text("Ödeme Bilgileri"),
                  ),
                ),*/

              ],
            ),


      ),
    floatingActionButton: CircularFabWidget(),

    ),

  );

}

















































/*class StudentScreen extends StatelessWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation:0.5,
          backgroundColor: Colors.transparent,
          title: const Text(
              "Öğrenci Ana Sayfa", style: TextStyle(fontSize: 22)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
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
          child:Center(
            child: Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          minimumSize: const Size(180.0, 180.0),
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>MapScreen()),
                          );
                        },
                        child: const Text("Duraklar",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.normal)),
                      ), //Container
                      const SizedBox(
                        width: 10,
                        height: 5,
                      ), //SizedBox
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          minimumSize: const Size(180.0, 180.0),
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>buschedule()),
                          );
                        },
                        child: const Text("Servis Saatleri",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.normal)),
                      ), //Container
                    ], //<Widget>[]
                    mainAxisAlignment: MainAxisAlignment.center,
                  ), //Row
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          minimumSize: const Size(180.0, 180.0),
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onPressed: () {

                        },
                        child: const Text("Servis Takip",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.normal)),
                      ), //SizedBox//Container
                      const SizedBox(
                        width: 10,
                        height: 5,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          minimumSize: const Size(180.0, 180.0),
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>TimerBack()),
                          );
                        },
                        child: const Text("Servise" '\n'"Yakınım" '\n'"Butonu", style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.normal)),
                      ) //SizedBox

                    ], //<Widget>[]
                    mainAxisAlignment: MainAxisAlignment.center,
                  ), //Row
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          minimumSize: const Size(180.0, 180.0),
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onPressed: () {

                        },
                        child: const Text("Ödeme Bilgileri",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.normal)),
                      ), //Container
                      const SizedBox(
                        width: 10,
                        height: 5,
                      ), //SizedBox
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          minimumSize: const Size(180.0, 180.0),
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingPageUI()),
                          );
                        },
                        child: const Text("Ayarlar", style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.normal)),
                      ), //Container

                    ], //<Widget>[]
                    mainAxisAlignment: MainAxisAlignment.center,
                  ), //Row
                ], //<widget>[]
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
              ), //Column
            ), //Container
          ),
        )//Center


    );
  }
}*/