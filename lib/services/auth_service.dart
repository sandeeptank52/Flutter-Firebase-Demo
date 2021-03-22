import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_projects/services/firestore_database_service.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  User _getAuthUser(User user) {
    return user;
  }

  Stream<User> get authStateChanges => _auth.authStateChanges();

  Future signOut() async {
    return await _auth.signOut();
  }

  Future signIn(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _getAuthUser(result.user);
    } catch (e) {
      return "${e.toString()}";
    }
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FireStoreDatabaseService(result.user.uid).updateUserData(email);
      return _getAuthUser(result.user);
    } catch (e) {
      return "${e.toString()}";
    }
  }
}
