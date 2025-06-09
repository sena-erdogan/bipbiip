import 'package:flutter/material.dart';
import 'StudentLogin.dart';
import 'ChangeEmail.dart';
import 'ChangePassword.dart';
import 'ForgotPassword.dart';
import 'Signup.dart';
import 'ChangePhoneNumber.dart';
import 'UserType.dart';
import 'driverscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'constants.dart';
import 'loading.dart';

class DriverLogin extends StatefulWidget {

  @override
  _DriverLoginState createState() => _DriverLoginState();
}

class _DriverLoginState extends State<DriverLogin> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;


  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: Text(
          'Giriş Ekranı',
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Hesabın yok mu? Kaydol!'),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              );
            },
          ),
        ],
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
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Tekrar Hoşgeldin!',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'Seni gördüğümüze çok sevindik!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ))),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.lightBlueAccent,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'Email'),
                  validator: (val) => val == null ? 'Emailinizi girin' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.lightBlueAccent,
                      border: OutlineInputBorder(),
                      filled: true,
                      hintText: 'Şifre'),
                  validator: (val) => val == null || val.length < 6 ? 'Şifreniz 6 karakterden uzun olmalıdır' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  textColor: Colors.white70,
                  child: Text('Şifreni mi Unuttun?'),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Color.fromRGBO(41, 155, 206, 1),
                    child: Text(
                      'Giriş',
                      style: TextStyle(color: Color.fromRGBO(43,50,62,1)),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            loading = false;
                            error =
                            'Girdiğiniz bilgilere ait bir hesap bulunamadı';
                          });
                        }
                        if (result != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => driverscreen()),
                          );
                        }
                      }
                    }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),),),),
    );
  }
}


