import 'package:bipbiip/DriverLogin.dart';
import 'package:bipbiip/StudentLogin.dart';
import 'package:bipbiip/SupervisorLogin.dart';
import 'package:flutter/material.dart';
import 'StudentLogin.dart';
import 'SupervisorLogin.dart';
import 'DriverLogin.dart';
import 'ChangeEmail.dart';
import 'ChangePassword.dart';
import 'ForgotPassword.dart';
import 'Signup.dart';
import 'ChangePhoneNumber.dart';
import 'UserType.dart';

class UserType extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation:0.5,
          backgroundColor: Colors.transparent,
          title: const Text("Kullanıcı Tipi"),
          centerTitle: true,
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
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                    children: <Widget>[
                      SizedBox(height: 100),
                      Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:
                          RaisedButton(
                            textColor: Color.fromRGBO(43,50,62,1),
                            color: Color.fromRGBO(41, 155, 206, 1),
                            child: Text('Öğrenci'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => StudentLogin()),
                              );
                            },
                          )),
                      SizedBox(height: 30),
                      Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:
                          RaisedButton(
                            textColor: Color.fromRGBO(43,50,62,1),
                            color: Color.fromRGBO(41, 155, 206, 1),
                            child: Text('Şoför'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DriverLogin()),
                              );
                            },
                          )),
                      SizedBox(height: 30),
                      Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:
                          RaisedButton(
                              textColor: Color.fromRGBO(43,50,62,1),
                              color: Color.fromRGBO(41, 155, 206, 1),
                              child: Text('Yönetici'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SupervisorLogin()),
                                );
                              }
                          )),
                    ]
                )
            )
        ));
  }
}