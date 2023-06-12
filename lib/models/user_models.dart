import 'package:cloud_firestore/cloud_firestore.dart';

class UserModels {
  String name;
  String email;
  String uid;
  Timestamp joinDate;
  String proImage;
  UserModels({
    required this.name,
    required this.email,
    required this.uid,
    required this.joinDate,
    required this.proImage,
  });

  //send userdata to database
  static Map<String, dynamic> userData({
    required String name,
    required String email,
    required String uid,
    required String imageUrl,
  }) {
    return {
      "username": name,
      "email": email,
      "uid": uid,
      "dateOfSignup": DateTime.now(),
      "prof image url": imageUrl,
    };
  }

  //user data get
  static Future<UserModels> getUseData(DocumentSnapshot snapshot) async {
    Map _data = snapshot.data() as Map<String, dynamic>;

    return UserModels(
      name: _data['username'],
      email: _data['email'],
      uid: _data['uid'],
      joinDate: _data['dateOfSignup'],
      proImage: _data['prof image url'],
    );
  }
}
