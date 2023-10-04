// ignore_for_file: unused_field

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethod {
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<String> uploadImagesToFirestore(Uint8List? image) async {
    UploadTask uploadTask = _storage
        .ref()
        .child("users")
        .child(_auth.currentUser!.uid)
        .child("Profile Picture")
        .child(_auth.currentUser!.uid)
        .putData(image!);

    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
