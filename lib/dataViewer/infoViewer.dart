import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:hfbird/dataViewer/infoCard.dart';
//import 'package:wefly/TicketDisplayer/testTicket.dart';

class InfoView extends StatelessWidget {
  // This widget is the root of your application.
  static String tag = 'card-page';
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new InfoViewPage(),
    );
  }
}

class InfoViewPage extends StatefulWidget {
  @override
  _InfoViewPageState createState() => new _InfoViewPageState();
}

class _InfoViewPageState extends State<InfoViewPage> {
  String url =
        'https://firestore.googleapis.com/v1/projects/hackfresno/databases/(default)/documents/events/';  
      //'https://my-json-server.typicode.com/We-Fly/flightsniffer-mobile/db';
  List data;
  List data2;
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["documents"];
      
      //data2 = data["fields"];
      
    });
  
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InfoListViewBuilder(data: data));
  }
}
