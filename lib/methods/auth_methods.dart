// ignore_for_file: unused_field, unused_local_variable

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone/methods/storage_method.dart';
import 'package:facebook_clone/models/user_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  //Sign up Methods
  Future<String> userInputDataGet({
    required String username,
    required String email,
    required String password,
    required String conPassword,
    required Uint8List? image,
  }) async {
    String _output;

    try {
      if (username.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          conPassword.isNotEmpty ||
          image != null) {
        if (password != conPassword) {
          return _output = "password not matched";
        } else {
          //User Id Get and User Account Create
          UserCredential _userCred = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          //user Prodile Photo apload to firebase storeage
          String downloadUrl =
              await StorageMethod().uploadImagesToFirestore(image);

          //User Details Upload to Firebase
          await _firestore
              .collection("users")
              .doc(_userCred.user!.uid)
              .set(UserModels.userData(
                name: username,
                email: email,
                uid: _userCred.user!.uid,
                imageUrl: downloadUrl,
              ));

          return _output = "user profile created";
        }
      } else {
        return _output = "some field is empty";
      }
    } catch (e) {
      // ignore: avoid_print
      return _output = e.toString();
    }
  }

  Future<String> firebaseLoginUser({
    required String email,
    required String password,
  }) async {
    String _message;
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return "success";
      }
      return "feild are empty";
    } catch (e) {
      return _message = e.toString();
    }
  }
}
