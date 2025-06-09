import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'administrationscreen.dart';
import 'database.dart';

class PaymentConfirm extends StatelessWidget {
  const PaymentConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: const Text('Ödeme Onayı'),
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
      body:
      Container(

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
    child: UserInformation(),
      ),
    );
  }
}


class UserInformation extends StatefulWidget  {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('myUsers').snapshots();
  bool odeme= false;
  String uID= '';
  String odemebilgisi='ödenmedi, onaylamak için tıklayın';

  late Query odemebilgis = FirebaseFirestore.instance
      .collection('myUsers')
      .where("role", isEqualTo:'ogrenci');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: odemebilgis.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView (
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              print(data['odeme']);
            if(data['odeme'] == true){
              odemebilgisi= "ödendi, iptal için tıklayın";
              odeme = true;
            }
            else {
              odemebilgisi = "ödenmedi, onaylamak için tıklayın";
              odeme= false;
            }
            return ListTile(
              title: Text(data['name'], style:  TextStyle(
                  fontSize: 22, fontWeight: FontWeight.normal, color: Colors.grey),
              ),
              subtitle: Text(odemebilgisi, style:  TextStyle(
                  fontSize: 22, fontWeight: FontWeight.normal),),
              trailing: Icon(Icons.check_circle_outline),
              isThreeLine: false,
              onTap: (){
                odeme = !odeme;
                uID=data['uid'];
                FirebaseFirestore.instance.collection("myUsers").doc(uID).update({'odeme': odeme });
              },


            );
          }).toList(),
        );
      },
    );
  }
}
/*
return ListTile(
title: Text(data['name']),
subtitle: Text(data['telefon']),
trailing: Icon(Icons.check_box),
isThreeLine: false,
onTap: (){
odeme = !odeme;
uID=data['uid'];
FirebaseFirestore.instance.collection("myUsers").doc(uID).update({'odeme': odeme });
},
);*/
/*
class CheckBoxModal{

  String title;
  bool value;
  CheckBoxModal({@required this.title, this.value= false});
} */
