
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentInfoUI extends StatefulWidget  {
  @override
  _PaymentInfoUI createState() => _PaymentInfoUI();
}


class _PaymentInfoUI extends State<PaymentInfoUI> {

  bool odeme= false;
  String txt= "ödenmedi";
  String userID="";
  // final user= FirebaseAuth.instance.currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;
  get uid => user.uid;

  late Query odemebilgisi = FirebaseFirestore.instance
      .collection('myUsers')
      .where("uid", isEqualTo: auth.currentUser?.uid);

  final CollectionReference myUserCollection = FirebaseFirestore.instance.collection('myUsers');



  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: Text(
          'Ödeme Bilgisi',
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

        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: odemebilgisi.snapshots(),

                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return ListView (
                      children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        odeme= data['odeme'];
                        if(odeme == true)
                          txt= "Ödemeniz onaylandı, teşekkür ederiz.";
                        else txt= "Ödenmeniz onaylanmadı, her ayın 1'i ile 10'u arası ödeme yapabilirsiniz.";
                        return ListTile(
                          title: Text(txt,style:  TextStyle(
                              fontSize: 22, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                          // subtitle: Text(""),
                        );
                      }).toList(),

                    );

                  },
                ),

              ),
            ],
          ),

        ),
      ) ,
    );

  }

}