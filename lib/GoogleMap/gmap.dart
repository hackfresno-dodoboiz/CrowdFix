import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class GMap extends StatefulWidget {
  @override
  State createState() => GMapState();
}

class GMapState extends State<GMap> {
  GoogleMapController mapController;

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
  }
}
