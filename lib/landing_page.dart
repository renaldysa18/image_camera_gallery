import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  File imageUri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  imageUri == null
                      ? Text('No image selected.')
                      : Image.file(imageUri, width: 300, height: 200, fit: BoxFit.cover),

                  Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: RaisedButton(
                        onPressed: () => getImageFromCamera(),
                        child: Text('Click Here To Select Image From Camera'),
                        textColor: Colors.white,
                        color: Colors.green,
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      )),

                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: RaisedButton(
                        onPressed: () => getImageFromGallery(),
                        child: Text('Click Here To Select Image From Gallery'),
                        textColor: Colors.white,
                        color: Colors.green,
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      ))
                ]))
    );
  }

  /// get image from camera
  Future<void> getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
        imageUri = image;
    });
  }

  ///get image from gallery
  Future<void> getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUri = image;
    });
  }
}
