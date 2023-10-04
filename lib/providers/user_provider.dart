// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../models/user_models.dart';

// class UserProvider extends ChangeNotifier {
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;

//   UserModels? _userData;

//   UserModels get user => _userData!;

//   Future<void> getUserData() async {
//     DocumentSnapshot _snapshot =
//         await _firestore.collection("users").doc(_auth.currentUser!.uid).get();

//     if(_snapshot != null){
//       _userData = await UserModels.getUseData(_snapshot);
//     }

//     notifyListeners();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_models.dart';

class UserProvder{
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;


  Future<UserModels> userProvider() async {
    DocumentSnapshot _snapshot =
        await _firestore.collection("users").doc(_auth.currentUser!.uid).get();
        print(_snapshot.data());
    return await UserModels.getUseData(_snapshot);
  }

}
