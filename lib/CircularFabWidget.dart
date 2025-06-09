import 'dart:math';
import 'package:bipbiip/Busschedule.dart';
import 'package:bipbiip/ContactUs.dart';
import 'package:bipbiip/about_us.dart';
import 'package:bipbiip/settingspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final double buttonSize = 50;

class CircularFabWidget extends StatefulWidget{
  @override
  State<CircularFabWidget> createState() => _CircularFabWidgetState();
}

class _CircularFabWidgetState extends State<CircularFabWidget>
  with SingleTickerProviderStateMixin {
    late AnimationController controller;

    @override
    void initState(){
      super.initState();

      controller = AnimationController(
        duration: const Duration(milliseconds: 250),
        vsync: this,
      );
    }

    @override
    void dispose(){
      controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) => Flow(
    delegate: FlowMenuDelegate(controller: controller),
    children: <IconData>[
      Icons.contact_support,  //0
      Icons.groups,           //1
      Icons.miscellaneous_services_outlined,   //2
      Icons.more_vert,
    ].map<Widget>(buildFAB).toList(),
  );

  Widget buildFAB(IconData icon) => SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: FloatingActionButton(
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 87, 34, 0.8),
      splashColor: Color.fromRGBO(255, 87, 34, 0.8),
      child: Icon(icon, color: Colors.white, size:30),
      onPressed: () {
        if(icon==Icons.contact_support){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ContactUs()));
        }
        if(icon==Icons.groups){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutUs()));
        }
        if(icon==Icons.miscellaneous_services_outlined){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingPageUI()));
        }
        if(controller.status == AnimationStatus.completed) {
          controller.reverse();
        } else{
          controller.forward();
        }
      },
      ),
  );
}

class FlowMenuDelegate extends FlowDelegate{
  final Animation<double> controller;

  const FlowMenuDelegate({required this.controller})
    : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context){
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;

    final n = context.childCount;

    for(int i=0; i<n; i++) {
      final isLastItem = i == context.childCount - 1;
      final setValue = (value) => isLastItem ? 0.0 : value;

      final radius = 180 * (controller.value);
      final theta = (i * pi * 0.5)/ (n-2);
      final x = xStart - setValue(radius * cos(theta)*0.5);
      final y = yStart - setValue(radius * sin(theta)*0.5);

      context.paintChild(
        i,
        transform: Matrix4.identity()
          ..translate(x, y, 0)
          ..translate(buttonSize / 2, buttonSize / 2)
          ..rotateZ(isLastItem ? 0.0 : 180 * (1 - controller.value) * pi / 180)
          ..scale(isLastItem ? 1.0 : max(controller.value, 0.5))
          ..translate(-buttonSize / 2, -buttonSize / 2)
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;

}