import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: SpinKitChasingDots(
          color: Color.fromRGBO(211, 87, 3, 1),
          size: 50.0,
        ),
      ),
    );
  }
}