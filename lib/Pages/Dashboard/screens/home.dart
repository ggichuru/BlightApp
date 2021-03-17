import 'package:blightclient/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dbReference = FirebaseFirestore.instance;
  Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Create Record'),
                onPressed: () {
                  //createRecord();
                  addData();
                },
              ),
              RaisedButton(
                child: Text('get Record'),
                onPressed: () {
                  //getUser();
                  fetchData();
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      data['title'].toString(),
                    ),
                    SizedBox(height: 8,),
                    Text(data['description'.toString()]),
                   // Text(FirebaseAuth.instance.currentUser.displayName)
                  ],
                ),
              )
              // Container(
              //   child: GetUserName(),
              // )
            ],
          ),
        ),
      ),
    );
  }

  addData() {
    Map<String, dynamic> demoData = {
      'uid': FirebaseAuth.instance.currentUser.uid,
      'title': 'Flutter out of Action',
      'description': 'InComplete Programming Guide to learn Flutter'
    };

    CollectionReference collectionReference = dbReference.collection('data');
    collectionReference.add(demoData);
  }

  fetchData() {
    CollectionReference collectionReference = dbReference.collection('data');
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        data = snapshot.docs[1].data();
      });
    });
  }

  fetchUser() {
    CollectionReference collectionReference = dbReference.collection('users');
    var user = FirebaseAuth.instance.currentUser.uid;
  }

  void createRecord() async {
    await dbReference.collection('books').doc('1').set({
      'title': 'Mastering Flutter',
      'description': 'Programming Guide for Dart'
    });

    DocumentReference ref = await dbReference.collection('books').add({
      'uid': FirebaseAuth.instance.currentUser.uid,
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
    print(ref.id);
  }

  // void getData() async {
  //   dbReference.collection('books').get().then((QuerySnapshot snapshot) {
  //     snapshot.docs.forEach((f) {
  //       print('${f.data()}');
  //     });
  //   });
  // }

  void getUser() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
        .then((value) => print(value.data()));
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((result) {
    //     FirebaseFirestore.instance
    //         .collection('users')
    //         .doc(result.id)
    //         .collection('users')
    //         .get()
    //         .then((querySnapshot) {
    //       querySnapshot.docs.forEach((result) {
    //         print(result.data());
    //       });
    //     });
    //   });
    // });
  }
}

class GetUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          final List<DocumentSnapshot> document = snapshot.data.docs;
          return ListView(
              children: document
                  .map((doc) => Card(
                        child: ListTile(
                          title: Text(doc.data()['fullName'] ?? ''),
                          subtitle: Text(doc.data()['email'] ?? ''),
                        ),
                      ))
                  .toList());

          // return new ListView(
          //   children: snapshot.data.docs.map((DocumentSnapshot document) {
          //     return new ListTile(
          //       title: new Text(document.data()['fullName'] ?? ""),
          //       subtitle: new Text(document.data()['email'] ?? ""),
          //     );
          //   }).toList(),
          // );
        });
  }
}
