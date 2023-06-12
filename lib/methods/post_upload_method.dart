// ignore_for_file: unused_field

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostStorageMethod {
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<String> uploadPostToFirestore(Uint8List? image, String id) async {
    UploadTask uploadTask = _storage
        .ref()
        .child("users")
        .child(_auth.currentUser!.uid)
        .child("upload post")
        .child(id)
        .putData(image!);

    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
