import 'package:flutter/material.dart';
import 'StudentLogin.dart';
import 'DriverLogin.dart';
import 'SupervisorLogin.dart';
import 'ChangeEmail.dart';
import 'ChangePassword.dart';
import 'ForgotPassword.dart';
import 'Signup.dart';
import 'ChangePhoneNumber.dart';
import 'UserType.dart';
import 'studentscreen.dart';

class ChangePhoneNumber extends StatelessWidget {

  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation:0.5,
          backgroundColor: Colors.transparent,
          title: Text(
              'Telefon Numaramı Değiştir',
              style: TextStyle(
                color: Colors.white70,
              )
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
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.phone_android_outlined,
                          color: Colors.white70,
                          size: 200.0,
                        )),
                    SizedBox(height: 10),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                            'Yeni telefon numaranızı girin',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white70,
                            ))),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Telefon Numarası',
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white70,
                          color: Color.fromRGBO(69,116,207,1),
                          child: Text('Telefon Numarasını Kaydet'),
                          onPressed: () {
                            print(phoneNumberController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChangePhoneNumberSuccessful()),
                            );
                          },
                        ))
                  ],
                ))));
  }
}

class ChangePhoneNumberSuccessful extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation:0.5,
          backgroundColor: Colors.transparent,
          title: Text(
              'Yeni Telefon Numarası',
              style: TextStyle(
                color: Colors.white70,
              )
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
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.check_circle_outlined,
                          color: Colors.white70,
                          size: 200.0,
                        )),
                    SizedBox(height: 10),
                    Container(
                        height: 50,
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                            'Telefon numaranız başarıyla değiştirildi.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ))),
                    SizedBox(height: 20),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white70,
                          color: Color.fromRGBO(69,116,207,1),
                          child: Text('Devam Et'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StudentScreen()),
                            );
                          },
                        ))
                  ],
                ))));
  }
}