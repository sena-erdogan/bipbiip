import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'StudentLogin.dart';
import 'DriverLogin.dart';
import 'SupervisorLogin.dart';
import 'ChangeEmail.dart';
import 'ChangePassword.dart';
import 'ForgotPassword.dart';
import 'Signup.dart';
import 'ChangePhoneNumber.dart';
import 'UserType.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: App()
    );
  }
  //static final ValueNotifier<ThemeMode> themeNotifier =
  //ValueNotifier(ThemeMode.light);
}

class App extends StatelessWidget{
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text("Error"+snapshot.error.toString()),
            ),
          );
        }
        if(snapshot.connectionState== ConnectionState.done){
          return Home();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
/*class Home extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.transparent,
          title: Text(
            'BipBiip',
          ),
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  //Color.fromRGBO(245, 101, 3, 1),
                  Color.fromRGBO(211, 87, 3, 1),
                  Color.fromRGBO(24, 28, 79, 1),
                  Color.fromRGBO(14, 17, 53, 1),
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
                        child: Text(
                          'Hoşgeldin!',
                          style: TextStyle(
                              color:Colors.white70,
                              fontWeight: FontWeight.w500,
                              fontSize: 60),
                        )),
                    SizedBox(height: 100),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 3),
                        child:
                        RaisedButton(
                          textColor: Colors.white70,
                          color: Color.fromRGBO(41, 155, 206, 1),
                          child: Text('Giriş',
                          style: TextStyle(
                              height: 2, fontSize: 22
                          ),),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserType()),
                            );
                          },
                        )),
                    SizedBox(height: 100),
                    Container(
                        child: Row(
                          children: <Widget>[
                            Text('Bir hesaba mı ihtiyacın var?',
                              style: TextStyle(
                                fontSize: 20,
                                color:Colors.white70,
                              ),
                            ),
                            FlatButton(
                              textColor: Colors.white70,
                              child: Text(
                                'Kaydol!',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      Signup()),
                                );
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ))
                  ],
                ))));
  }
}*/

