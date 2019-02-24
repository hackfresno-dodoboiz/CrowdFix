import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:hf_bird/camera/vision.dart';

Future<void> main() async {
  cameras = await availableCameras();
  runApp(CameraApp());
}
