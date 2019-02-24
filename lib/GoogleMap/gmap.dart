import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hfbird/routes/displayEvent.dart';
//import 'package:geolocator/geolocator.dart';
class GMap extends StatefulWidget {
  @override
  State createState() => GMapState();
}

 
  var clients = [];


class GMapState extends State<GMap> {
  
  GoogleMapController mapController;
  var currentLocation;
  var markerRefs = <String, dynamic>{};
  void initState(){
    super.initState();
   // Geolocator().getCurrentPosition().then((currloc){
      setState((){
        //currentLocation = currloc;
        populate();
   //   });
    });
  }

  populate(){
    clients = [];
    Firestore.instance.collection('events').getDocuments().then((docs) {
      if (docs.documents.isNotEmpty) {
        setState(() {
          //clientsToggle = true;
        });
        for (int i = 0; i < docs.documents.length; ++i) {
          clients.add(docs.documents[i].data);
          initMarker(docs.documents[i].data);
        }
      }
    });
  }

  initMarker(client) {
    mapController.clearMarkers().then((val) {
      mapController.addMarker(MarkerOptions(
          position:
              LatLng(client['location'].latitude, client['location'].longitude),
          draggable: false,
          infoWindowText: InfoWindowText(client['event_name'], "wow"))
          //InfoWindowText(client['event_name'], client['desc']))
      
      ).then((marker){
        markerRefs[marker.id] = {'lat': client['location'].latitude, 'lng': client['location'].longitude};
        return marker;
      });
    });
  }


  // _handleMethodCall(MethodCall call){
  //   if (call.method == 'marker#onTap'){
  //       final String markerId = call.arguments['marker'];
  //       final Marker marker = _markers[markerId];
  //       if (marker != null) {
  //         onMarkerTapped(marker);
  //       }
  // }

    // marker click event
    void onMarkerTapped(Marker marker) {
      //print('HELP!!!');
      var selectedMarker = markerRefs[marker.id];  // here you will get your id.
      
      debugPrint(selectedMarker);
      
      //TODO
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => 
          DisplayEvent(
            lat: markerRefs[marker.id].lat, 
            lng: markerRefs[marker.id].lng),
          )
       );
    }




  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          
          onMapCreated: _onMapCreated,
          initialCameraPosition: _buildCameraPosition(),
          myLocationEnabled: true,
          
        ),
      ),
    );
  }

  CameraPosition _buildCameraPosition() {
    return CameraPosition(
              target: LatLng(36.7378, -119.7871),
              tilt: 45.0,
              zoom: 15.0,
              bearing: 45,                
            );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
    mapController.onMarkerTapped.add(onMarkerTapped);

    
  }
  
}



  //   Firestore.instance.collection('events').snapshots().listen((data) =>
  //       data.documents.forEach((doc) => 
  //       mapController.addMarker(
  //       MarkerOptions(
  //           //position: LatLng(doc['location'].latitude,doc['location'].longitude),
  //           position: LatLng(doc['location'].latitude,doc['location'].longitude),
  //           draggable: false,
  //           //infoWindowText: InfoWindowText(doc['event_title'], doc['desc']),
  //         ),
  //       ))
  //   );
  // }


      //   mapController.animateCamera(
      //   CameraUpdate.newLatLngZoom(
      //     LatLng(client['location'].latitude, client['location'].longitude),
      //     10.0, // Zoom factor
      //   ),
      // );