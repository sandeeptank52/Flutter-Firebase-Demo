import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/models/news.dart';

class FireStoreDatabaseService {
  final String uid;

  FireStoreDatabaseService(this.uid);

  final userReference = FirebaseFirestore.instance.collection("users");
  final newsReference = FirebaseFirestore.instance.collection("news");
  final sportNewsReference = FirebaseFirestore.instance.collection("sport_news");

  Future updateUserData(String email, String fName, String lName) {
    return userReference
        .doc(uid)
        .set({'email': email, 'first name': fName, 'last name': lName});
  }

  Stream<QuerySnapshot> get userDetail {
    return userReference.snapshots();
  }

  List<News> _getNewsData(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => News(doc.get('title') ?? ' ', doc.get('dis') ?? ' ')).toList();
  }

  Stream<List<News>> get news {
    return newsReference.snapshots().map((_getNewsData));
  }


  List<News> _getSportNewsData(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => News(doc.get('title') ?? ' ', doc.get('dis') ?? ' ')).toList();
  }

  Stream<List<News>> get sportNews {
    return sportNewsReference.snapshots().map((_getNewsData));
  }
}
