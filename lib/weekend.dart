import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bipbiip/main.dart';
import 'package:bipbiip/Busschedule.dart';

class Weekend extends StatelessWidget {
  const Weekend({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: Text('Otobüs Saatleri'),
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
        // margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
        padding: EdgeInsets.only(top: 110,left: 13,right: 13),
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>buschedule()));
                        },
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(150, 50),
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20)),
                              side: BorderSide(
                                  color: Color.fromRGBO(195, 195, 195, 0.4), width: 1)
                          ),
                        ),
                        child: Text('Hafta İçi',
                          style: TextStyle(height: 2, fontSize: 18),
                        ),

                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Weekend()));
                        },
                        style: OutlinedButton.styleFrom(
                          primary: Color.fromRGBO(31, 36, 91, 1),
                          fixedSize: Size(150, 50),
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20)),
                              side: BorderSide(
                                  color: Color.fromRGBO(195, 195, 195, 0.4), width: 1)
                          ),
                        ),
                        child: Text('Hafta Sonu',
                          style: TextStyle(height: 2, fontSize: 18),
                        ),
                      ),
                    ]
                ),
                SingleChildScrollView(
                  child: Flexible(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 90.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 10.0,
                            bottom:300.0
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30.0,
                              ),
                              child: Column(
                                children: <Widget>[
                                  //greeting text
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround,
                                            children: <Widget>[
                                              Text(
                                                "Kyk'dan",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(195, 195, 195, 1),
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Text(
                                                " Üniversite'den",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(195, 195, 195, 1),
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ]
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  //app work
                                  Divider(
                                    height: 10.0,
                                    thickness: 2,
                                    color:Color.fromRGBO(253, 111, 13, 1),
                                  ),
                                  Column(

                                      children: <Widget>[
                                        Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 45, top: 20),
                                                child: Text(
                                                  '10.00',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(195, 195, 195, 1),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight
                                                        .normal,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 60, top: 20),
                                                child: Text(
                                                  '|',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(46,72,128, 1),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight
                                                        .normal,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 70, top: 20),
                                                child: Text(
                                                  '19.00',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(195, 195, 195, 1),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight
                                                        .normal,
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                        Divider(
                                          height: 8.0,
                                          thickness: 0.5,
                                          indent: 20,
                                          endIndent: 35,
                                          color: Color.fromRGBO(46,72,128, 1),
                                        ),
                                        Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 45, top: 15),
                                                child: Text(
                                                  '12.00',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(195, 195, 195, 1),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight
                                                        .normal,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 60, top: 15),
                                                child: Text(
                                                  '|',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(46,72,128, 1),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight
                                                        .normal,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 70, top: 15),
                                                child: Text(
                                                  '22.00',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(195, 195, 195, 1),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight
                                                        .normal,
                                                  ),
                                                ),
                                              ),
                                            ]
                                        ),
                                        Divider(
                                          height: 8.0,
                                          thickness: 0.5,
                                          indent: 20,
                                          endIndent: 35,
                                          color: Color.fromRGBO(46,72,128, 1),
                                        ),
                                      ]
                                  ),
                                  //add button
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),

    );
  }
}