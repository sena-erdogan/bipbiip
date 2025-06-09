import 'package:flutter/material.dart';
import 'administrationscreen.dart';
class StopAddRemove extends StatelessWidget{
  const StopAddRemove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation:0.5,
        backgroundColor: Colors.transparent,
        title: const Text('Durak Ekle/Çıkar'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),

      ),
        body:Container(
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
        )

    );
  }
}
