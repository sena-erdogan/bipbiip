import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'loading.dart';

class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String name= '';
  String telefon= '';
  String role= '';
  bool odeme= false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: Text(
          'Kayıt Ekranı',
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Giriş yap!'),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentLogin()),
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
                      'BipBiip',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                      hintText: 'İsim - Soyisim'),
                  validator: (val) => val == null ? 'İsminizi ve soyisminizi girin' : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                      hintText: 'Telefon Numarası'),
                  validator: (val) => val == null ? 'Telefon numaranızı girin' : null,
                  onChanged: (val) {

                    setState(() => telefon = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
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
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                      filled: true,
                      hintText: 'Şifre'),
                  validator: (val) => val == null || val.length < 6 ? 'Şifreniz 6 karakterden uzun olmalıdır' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Color.fromRGBO(41, 155, 206, 1),
                    child: Text(
                      'Kaydol',
                      style: TextStyle(color: Color.fromRGBO(43,50,62,1)),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password, telefon,name,role,odeme);
                        if(result == null) {
                          setState(() {
                            loading = false;
                            error = 'Geçerli bir mail adresi girin';
                          });
                        }
                        if (result != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StudentLogin()),
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