import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_projects/models/news.dart';

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

// Stream<List<News>> get getNews {
//   List<News> newsList = List.empty();
//
//   newsReference.snapshots().forEach((element) {
//     for (var doc in element.docChanges) {
//       //newsList.add(News(element.da);
//     }
//   });
//   return List.empty();
// }
}
