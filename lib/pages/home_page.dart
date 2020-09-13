
import 'dart:convert' as convert;
import 'dart:typed_data';

import 'package:dacn_iot/data/image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImageObject> imageList=[];

  @override
  void initState() {
    super.initState();

    DatabaseReference imageRef=FirebaseDatabase.instance.reference().child('esp32-cam');

    imageRef.once().then((DataSnapshot snap){
      var KEYS=snap.value.keys;
      var DATA=snap.value;

      imageList.clear();

      for(var individualKey in KEYS)
      {
        ImageObject imageObject=new ImageObject(
         photo: DATA[individualKey]['photo'],
        );
        imageList.add(imageObject);
      }
      setState(() {
        print(imageList.length);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Picture\'s ESP32-Cam')),
      ),
      body: Container(
        child: imageList.length==0?Text('Data Null'):ListView.builder(itemCount: imageList.length,itemBuilder: (_,index){
          return imageUI(imageList[index].photo);
        }),
      ),
    );
  }

  Widget imageUI(String image){
    if (image == null)
      return new Container();
    Uint8List decodeImg = convert.base64.decode(image);
    return Container(
      child: Image.memory(decodeImg),
    );
  }
}
