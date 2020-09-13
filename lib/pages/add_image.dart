//import 'dart:io';
//
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart';
//
//class AddImage extends StatefulWidget {
//  @override
//  _AddImageState createState() => _AddImageState();
//}
//
//class _AddImageState extends State<AddImage> {
//
//  File image;
//  Future _getImage() async {
//    // ignore: deprecated_member_use
//    final selectedImage =await ImagePicker.pickImage(source: ImageSource.gallery);
//    setState(() {
//      image = selectedImage;
//    });
//  }
//
////Create and Get Url
//  Future _uploadImage(BuildContext context) async {
//    String fileName = basename(image.path);
//    StorageReference firebaseStorageRef =
//        FirebaseStorage.instance.ref().child('images/${fileName}');
//    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
//    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
//
//    var downloadUrl = await (taskSnapshot).ref.getDownloadURL();
//    var url = downloadUrl.toString();
//
//    DocumentReference ref = await Firestore.instance
//        .collection('esp32-cam')
//        .add({'photo': '$url'});
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Add Image'),
//        backgroundColor: Colors.black,
//      ),
//      body: SingleChildScrollView(
//        child: Center(
//          child: image == null
//              ? Padding(
//            padding: const EdgeInsets.only(top: 350),
//            child: GestureDetector(
//                onTap: _getImage,
//                child: Text(
//                  'Select An Image',
//                  style: TextStyle(fontSize: 25, color: Colors.red),
//                )),
//          )
//              : Column(
//            children: <Widget>[
//              Image.file(image, width: double.infinity),
//              Padding(
//                padding: const EdgeInsets.only(top: 30),
//                child: OutlineButton.icon(
//                  icon: Icon(Icons.add),
//                  label: Text('Upload Image'),
//                  borderSide:
//                  BorderSide(color: Colors.grey.withOpacity(0.5)),
//                  onPressed: () async {
//                    await _uploadImage(context);
//                    Navigator.pop(context);
//                  },
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          _getImage();
//        },
//        tooltip: 'Choose Image',
//        child: Icon(Icons.add_a_photo),
//      ),
//    );
//  }
//}
