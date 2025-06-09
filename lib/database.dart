import 'myUser.dart';
import 'user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService(this.uid);

  // collection reference
  final CollectionReference myUserCollection = FirebaseFirestore.instance.collection('myUsers');

  Future<void> updateUserData(String name, String telefon, String email, String role, bool odeme) async {
    return await myUserCollection.doc(uid).set({
      'name': name,
      'telefon': telefon,
      'email': email,
      'role': role,
      'uid': uid,
      'odeme': odeme,
    });
  }

  // brew list from snapshot
  List<MyUser> _myUserListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return MyUser(
          name: doc.get('name') ?? ''
      );
    }).toList();
  }

  // user data from snapshots
  MyUserTypeData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return MyUserTypeData(
        uid: uid,
        name: snapshot.get('name')
    );
  }

  // get brews stream
  Stream<List<MyUser>> get myUsers {
    return myUserCollection.snapshots()
        .map(_myUserListFromSnapshot);
  }

  // get user doc stream
  Stream<MyUserTypeData> get myUserTypeData {
    return myUserCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}