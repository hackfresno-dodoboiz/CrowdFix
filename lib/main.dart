import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hfbird/bottomappbar/btmappbar.dart';
import 'package:hfbird/form/stepper_form.dart';
import 'package:hfbird/dataViewer/infoViewer.dart';


void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    
    BottomAB.tag: (context) => BottomAB(),
    StepperForm.tag: (context) => StepperForm(),
    InfoView.tag: (context) => InfoView(),
  };
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      //body: InfoView(),
      body: BottomAB(),
    ),//BttmAppBar(),
      routes: routes,
    );
  }
}