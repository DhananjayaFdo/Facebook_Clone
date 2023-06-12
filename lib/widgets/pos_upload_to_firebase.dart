import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../methods/post_upload_method.dart';

class Upload {
  final _firestore = FirebaseFirestore.instance;

  postUpload(Map? map, String descr, Uint8List? image) async {
    String id = const Uuid().v1();

    String url = await PostStorageMethod().uploadPostToFirestore(image, id);

    Map<String, dynamic> postData = {
      "uid": map!['uid'],
      "post Id": id,
      "username": map['username'],
      "uploadTime": DateTime.now(),
      'profilePicture': map['prof image url'],
      "post utl": url,
      "descrition": descr,
    };

    await _firestore.collection("post").doc(id).set(postData);
  }
}
