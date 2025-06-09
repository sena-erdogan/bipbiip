import 'package:bipbiip/Busschedule.dart';
import 'package:bipbiip/CircularFabWidget.dart';
import 'package:bipbiip/Mapscreen.dart';
import 'package:bipbiip/Notifications.dart';
import 'package:bipbiip/NotificationsSupervisor.dart';
import 'package:bipbiip/StopRequests.dart';
import 'package:bipbiip/bustracking.dart';
import 'package:bipbiip/timerback.dart';
import 'package:flutter/material.dart';
import 'settingspage.dart';
import 'paymentconfirm.dart';
import 'stopaddremove.dart';
import 'studentaddremove.dart';
import 'driveraddremove.dart';
import 'homepage.dart';
import 'auth.dart';
import 'loading.dart';
import 'dart:io';

class AdministrationScreen extends StatefulWidget{
  AdministrationScreen({Key? key}) : super(key: key);

  @override
  _AdministrationScreenState createState() => _AdministrationScreenState();
}



class _AdministrationScreenState extends State<AdministrationScreen> {

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
            "Yönetici Ana Sayfa", style: TextStyle(fontSize: 22)),
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AdministrationScreen()));
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
                          margin:EdgeInsets.only(top:190,left:30),
                          child:ElevatedButton(
                            child:Column(
                              children: [
                                Icon(Icons.badge_outlined,size:50),
                                Text('Kayıt İşlemleri',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
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
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen()));
                            },
                            //child:Text("Duraklar"),
                          ),),
                        Container(
                          margin:EdgeInsets.only(left:15,top:30,bottom:20),
                          child:ElevatedButton(
                            child:Column(
                              children: [
                                Icon(Icons.assignment_sharp,size:40),
                                Text('Öğrenci Ödeme Takip Sistemi',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              padding:EdgeInsets.only(top:40),
                              primary: Color.fromRGBO(255, 87, 34, 0.8),
                              //minimumSize:Size(180.0, 180.0),
                              fixedSize: Size(130,200),
                              shape: RoundedRectangleBorder( //to set border radius to button
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            onPressed: () {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentConfirm()));
                            },
                            //child:Text("Servis Saatleri"),
                          ),
                        ),

                      ],),),
                  Container(
                   //margin:EdgeInsets.only(right:10),
                    child:Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:140,left:2),
                          child:ElevatedButton(
                            child:Column(
                              children: [
                                Icon(Icons.notification_add_outlined,size:50),
                                Text('Bildirim Gönderme',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
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
                            onPressed: () {
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TimerBack()));
                            },
                            //child:Text("Servise Yakınım"),
                          ),),
                        Container(
                          margin: EdgeInsets.only(top:30,left:0.5),
                          child:ElevatedButton(
                            child:Column(
                              children: [
                                Icon(Icons.add_location_outlined,size:50),
                                Text('Durak İstekleri',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 87, 34, 0.8),
                              padding:EdgeInsets.only(top: 15),
                              //minimumSize:Size(180.0, 180.0),
                              fixedSize: Size(180,110),
                              shape: RoundedRectangleBorder( //to set border radius to button
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StopRequests()));
                            },
                            //child:Text("Ödeme Bilgileri"),
                          ),
                        ),
                      ],
                    ),),],),),

          ],
        ),


      ),
      floatingActionButton: CircularFabWidget(),
    ),
  );

}























/*class AdministrationScreen extends StatelessWidget {
  const AdministrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation:0.5,
          backgroundColor: Colors.transparent,
          title: const Text(
              "Yönetici Ana Sayfa", style: TextStyle(fontSize: 22)),
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
            padding: const EdgeInsets.all(14.0),
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
                          MaterialPageRoute(
                              builder: (context) => const StopAddRemove()),
                        );
                      },
                      child: const Text("Durak"'\n' "ekle/çıkar",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.normal)),
                    ), //Container
                    const SizedBox(
                      width: 20,
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
                              builder: (context) => const StudentAddRemove()),
                        );
                      },
                      child: const Text("Öğrenci"'\n'"ekle/çıkar",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DriverAddRemove()),
                        );
                      },
                      child: const Text("Şoför" '\n'"ekle/çıkar",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.normal)),
                    ), //SizedBox//Container
                    const SizedBox(
                      width: 20,
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
                          MaterialPageRoute(
                              builder: (context) => const PaymentConfirm()),
                        );
                      },
                      child: const Text("Ödeme onayı", style: TextStyle(
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
          ), //Container*/
      /*  ),
    )//Center


    );
  }
}*/