import 'package:flutter/material.dart';

class DisplayEvent extends StatelessWidget {
  static String tag = 'tag1';
  var lng;
  var lat;
  
  DisplayEvent({Key key,  @required this.lat, @required this.lng}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Container(
        child: Center(
          
          child: Row(
            children: <Widget>[
              Text(this.lat),
              Text(this.lng),
              RaisedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                },
              
                child: Text('Go back!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}