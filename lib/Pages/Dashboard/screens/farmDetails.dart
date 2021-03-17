import 'package:blightclient/Pages/Dashboard/config/configuration.dart';
import 'package:blightclient/Pages/Dashboard/screens/farm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FarmDetails extends StatefulWidget {
  @override
  _FarmDetailsState createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu_outlined),
        onPressed: null,
        backgroundColor: Colors.green[800],
        highlightElevation: 20,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      body: FarmEdit(),
    );
  }
}

class FarmEdit extends StatefulWidget {
  @override
  _FarmEditState createState() => _FarmEditState();
}

class _FarmEditState extends State<FarmEdit> {
  TextEditingController farmController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('farms').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return ListView(
                  padding: EdgeInsets.only(bottom: 80),
                  children:
                      snapshot.data.docs.map((QueryDocumentSnapshot document) {
                    return Container(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                      child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Container(
                                    margin: EdgeInsets.only(top: 40),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.arrow_back_ios),
                                              onPressed: () {
                                                // Navigator.pop(context);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Farm()),
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 25),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child:
                                          Image.asset('assets/images/pt.png'),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.75,
                                      width: MediaQuery.of(context).size.width *
                                          0.89,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: shadowList,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 5),
                                                Text('FARM NAME',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: Colors.green[800],
                                                    ),
                                                    Text('Kinangop, Kenya',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400))
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            // NewWidget1()
                                            SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  DataTable(
                                                    columns: const <DataColumn>[
                                                      DataColumn(
                                                          label: Text(
                                                              'Parameters',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green))),
                                                      DataColumn(
                                                          label: Text('Details',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green)))
                                                    ],
                                                    rows: const <DataRow>[
                                                      DataRow(cells: <DataCell>[
                                                        DataCell(Text(
                                                            'Temparature',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))),
                                                        DataCell(Text('24'))
                                                      ]),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text('Blight Predictions',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.green,
                                                          fontSize: 20)),
                                                  // SizedBox(height: 10),
                                                  DataTable(
                                                    columns: const <DataColumn>[
                                                      DataColumn(
                                                          label: Text(
                                                              'Parameters',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green))),
                                                      DataColumn(
                                                          label: Text('Details',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green)))
                                                    ],
                                                    rows: const <DataRow>[
                                                      DataRow(cells: <DataCell>[
                                                        DataCell(Text(
                                                            'Possibility',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))),
                                                        DataCell(Text('True'))
                                                      ]),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  child: Text('Edit'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.teal,
                                    onPrimary: Colors.white,
                                    onSurface: Colors.grey,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Update Dilaog"),
                                            content: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Farm: ",
                                                  textAlign: TextAlign.start,
                                                ),
                                                TextField(
                                                  controller: farmController,
                                                  decoration: InputDecoration(
                                                    hintText: document['farm'],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 20),
                                                  child: Text("Farmer: "),
                                                ),
                                                TextField(
                                                  controller: nameController,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        document['farmer'],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: RaisedButton(
                                                  color: Colors.red,
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    "Undo",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              // Update Button
                                              RaisedButton(onPressed: () {
                                                Map<String, dynamic>
                                                    updateBook =
                                                    new Map<String, dynamic>();
                                                updateBook["farm"] =
                                                    farmController.text;
                                                updateBook["farmer"] =
                                                    nameController.text;

                                                // Updae Firestore record information regular way
                                                FirebaseFirestore.instance
                                                    .collection("farms")
                                                    .doc(document.id)
                                                    .update(updateBook)
                                                    .whenComplete(() {
                                                  Navigator.of(context).pop();
                                                });
                                                Text(
                                                  "update",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                );
                                              }),
                                            ],
                                          );
                                        });
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList());
          }
          
        });
  }

  
}
