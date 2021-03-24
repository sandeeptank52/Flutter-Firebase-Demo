import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDatabaseService {
  final String uid;

  FireStoreDatabaseService(this.uid);

  final userReference = FirebaseFirestore.instance.collection("users");
  final newsReference = FirebaseFirestore.instance.collection("news");

  Future updateUserData(String email, String fname, String lname) {
    return userReference
        .doc(uid)
        .set({'email': email, 'first name': fname, 'last name': lname});
  }

  Stream<QuerySnapshot> get userDetail {
    return userReference.snapshots();
  }
}
