import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'user.dart';
import 'database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  MyUserType? _userFromUser(User? user) {
    return user != null ? MyUserType(uid: user.uid) : null;
  }

  // auth change MyUserType stream
  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();
  //.map((FirebaseUser user) => _userFromFirebaseUser(user));


  // sign in anon
  Future? signInAnon() async {
    try {
      User? user = (await FirebaseAuth.instance.signInAnonymously()).user;
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future? signInWithEmailAndPassword(String email, String password) async {
    try {
      User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
      return _userFromUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future? registerWithEmailAndPassword(String email, String password, String telefon, String name,String role, bool odeme) async {
    try {

      User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
      if(user != null) await DatabaseService(user.uid).updateUserData( name,telefon,email,role,odeme);

      return _userFromUser(user);
      // create a new document for the user with the uid
      //if(user != null) await DatabaseService(user.uid).updateUserData('new crew member');
      return _userFromUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<String> inputData() async {
    final User user = await FirebaseAuth.instance.currentUser!;
    final String uid = user.uid.toString();

    return uid;
  }

}
/*
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User? _userFromUser(User? user) {
    return user != null ? user : null;
  }

  // auth change user stream
  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();
    //.map((User user) => _userFromUser(user));

  // sign in anon
  Future signInAnon() async {
    try {
      User? user = (await FirebaseAuth.instance.signInAnonymously()).user;
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password


  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
      return _userFromUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}*/