import 'package:flutter/material.dart';
import 'package:birdtrigger/GoogleMap/gmap.dart';
import 'package:birdtrigger/form/stepper_form.dart';

class BottomAB extends StatefulWidget {
  static String tag = 'bottom-app-bar';

  _BottomABState createState() => _BottomABState();
}

class _BottomABState extends State<BottomAB> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromARGB(0, 251, 108, 112),
      key: _scaffoldKey,
      //drawer: new AppDrawer(),
      body: GMap(),
      floatingActionButton: _buildFab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.red,
            highlightColor: Colors.redAccent,
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          IconButton(
            icon: Icon(Icons.photo_album),
            color: Colors.blue,
            highlightColor: Colors.redAccent,
            onPressed: () {},
          ),
          SizedBox(
            height: 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          IconButton(
            icon: Icon(Icons.photo),
            color: Colors.green,
            highlightColor: Colors.redAccent,
            onPressed: () {
              // _scaffoldKey.currentState.openDrawer();
            },
          ),
          IconButton(
            icon: Icon(Icons.navigation),
            color: Colors.orange,
            highlightColor: Colors.redAccent,
            onPressed: () {
              //Navigator.of(context).pushNamed(FloatActBttn.tag);
            },
          )
        ],
      ),
    );
  }
}

Widget _buildFab(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.of(context).pushNamed(StepperForm.tag);//StepperForm();//AppDrawer();
    },
    tooltip: 'fab',
    elevation: 4.0,
    
    //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Icon(Icons.add_a_photo),
  );
}
