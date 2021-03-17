import 'package:blightclient/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  Future createUser(Users user) async {
    try {
      await _users.doc(user.uid).set(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  // Future getUser(String uid) async {
  //   try {
  //     var userData = await FirebaseFirestore.instance.collection('users').get();
  //     return Users.fromData(userData.);
  //   } catch (e) {
  //     return e.message;
  //   }
  // }
}
