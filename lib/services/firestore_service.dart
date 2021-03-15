import 'package:blightclient/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  Future createUser(Users user) async {
    try {
      await _users.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.message;
    }
  }
}
