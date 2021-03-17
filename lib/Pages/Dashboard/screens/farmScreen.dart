import 'package:blightclient/Pages/Dashboard/config/configuration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FarmsScreen extends StatefulWidget {
  @override
  _FarmsScreenState createState() => _FarmsScreenState();
}

class _FarmsScreenState extends State<FarmsScreen> {
  TextEditingController farmController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController sizeController = new TextEditingController();
  TextEditingController tempController = new TextEditingController();
  TextEditingController humidityController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController varietyController = new TextEditingController();
  TextEditingController resistanceController = new TextEditingController();
  TextEditingController occurenceController = new TextEditingController();
  TextEditingController sprayingController = new TextEditingController();
  TextEditingController measuresController = new TextEditingController();

  final userId = FirebaseAuth.instance.currentUser.uid;

  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Farms')),
        backgroundColor: Colors.white,
      ),
      body: FarmsList(),
      // backgroundColor: Color(0xFF51822b).withOpacity(.85),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF51822b).withOpacity(.85),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(child: Text("Add Farm")),
                          TextField(
                            controller: farmController,
                            decoration: InputDecoration(
                                labelText: 'Farm Name', hintText: 'farmName'),
                          ),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                labelText: 'Farm Location',
                                hintText: 'location'),
                          ),
                          TextField(
                            controller: sizeController,
                            decoration: InputDecoration(
                                labelText: 'Farm size', hintText: 'farmize'),
                          ),
                          TextField(
                            controller: tempController,
                            decoration: InputDecoration(
                                labelText: 'Current Temp', hintText: 'Temp'),
                          ),
                          TextField(
                            controller: humidityController,
                            decoration: InputDecoration(
                                labelText: 'Current Humidity',
                                hintText: 'humidity'),
                          ),
                          TextField(
                            controller: dateController,
                            decoration: InputDecoration(
                                labelText: 'Planting date', hintText: 'date'),
                          ),
                          TextField(
                            controller: varietyController,
                            decoration: InputDecoration(
                                labelText: 'Variety', hintText: 'variety'),
                          ),
                          DropdownButton<ListItem>(
                            value: _selectedItem,
                            hint: Text('label'),
                            items: _dropdownMenuItems,
                            onChanged: (value) {
                              setState(() {
                                _selectedItem = value;
                                
                              });
                            },
                          ),
                          TextField(
                            controller: resistanceController,
                            decoration: InputDecoration(
                                labelText: 'Crop Resistance',
                                hintText: 'location'),
                          ),
                          TextField(
                            controller: occurenceController,
                            decoration: InputDecoration(
                                labelText: 'Occurence', hintText: 'occurence'),
                          ),
                          TextField(
                            controller: sprayingController,
                            decoration: InputDecoration(
                                labelText: 'Spraying', hintText: 'spraying'),
                          ),
                          TextField(
                            controller: measuresController,
                            decoration: InputDecoration(
                                labelText: 'Measures', hintText: 'spraying'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Undo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    //Add Button

                    RaisedButton(
                      onPressed: () {
                        Map<String, dynamic> newFarm =
                            new Map<String, dynamic>();
                        newFarm["uid"] = userId;
                        newFarm["farmName"] = farmController.text;
                        newFarm["location"] = nameController.text;
                        newFarm["farmSize"] = sizeController.text;
                        newFarm["temparature"] = tempController.text;
                        newFarm["humidity"] = humidityController.text;
                        newFarm["plantingDate"] = dateController.text;
                        newFarm["variety"] = varietyController.text;
                        newFarm["resistance"] = resistanceController.text;
                        newFarm["occurence"] = occurenceController.text;
                        newFarm["spraying"] = sprayingController.text;
                        newFarm["measures"] = measuresController.text;

                        FirebaseFirestore.instance
                            .collection("farms")
                            .add(newFarm)
                            .whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Text(
                        "save",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                );
              });
        },
        tooltip: 'Add Title',
        child: Icon(Icons.add),
      ),
    );
  }
}

class FarmsList extends StatefulWidget {
  @override
  _FarmsListState createState() => _FarmsListState();
}

class _FarmsListState extends State<FarmsList> {
  TextEditingController farmController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController sizeController = new TextEditingController();
  TextEditingController tempController = new TextEditingController();
  TextEditingController humidityController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController varietyController = new TextEditingController();
  TextEditingController resistanceController = new TextEditingController();
  TextEditingController occurenceController = new TextEditingController();
  TextEditingController sprayingController = new TextEditingController();
  TextEditingController measuresController = new TextEditingController();

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
            return new ListView(
              padding: EdgeInsets.only(bottom: 80),
              children:
                  snapshot.data.docs.map((QueryDocumentSnapshot document) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: GestureDetector(
                    // onTap: () {},
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              insetPadding: EdgeInsets.all(10),
                              title: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 5),
                                      Text(document['farmName'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green[800],
                                          ),
                                          Text(document['location'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400))
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Center(
                                        child: Text(
                                      'Crop Info',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Farm Size',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(document['farmSize'])
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Planting Date',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(document['plantingDate'])
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Potato Variety',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(document['variety'])
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Variety Resistance',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(document['resistance'])
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                        child: Text(
                                      'Weather Conditions',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Temparature',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(document['temparature'])
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Humidity',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(document['humidity'])
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RaisedButton(
                                        color: Colors.red,
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('farms')
                                              .doc(document.id)
                                              .delete()
                                              .whenComplete(() =>
                                                  Navigator.of(context).pop())
                                              .catchError((e) => print(e));
                                        },
                                      ),
                                      SizedBox(width: 20),
                                      RaisedButton(
                                        color: Colors.green,
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Center(
                                                    child: Text(
                                                        document['farmName'])),
                                                content: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    TextField(
                                                      controller:
                                                          farmController,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText: document[
                                                                  'farmName'],
                                                              labelText:
                                                                  'Farm Name'),
                                                    ),
                                                    TextField(
                                                      controller:
                                                          nameController,
                                                      textAlign: TextAlign.left,
                                                      decoration: InputDecoration(
                                                          hintText: document[
                                                              'location'],
                                                          labelText:
                                                              'Farm Location',
                                                          alignLabelWithHint:
                                                              true),
                                                    ),
                                                    TextField(
                                                      controller:
                                                          farmController,
                                                      decoration: InputDecoration(
                                                          hintText: document[
                                                              'temparature'],
                                                          labelText:
                                                              'Temparature'),
                                                    ),
                                                    TextField(
                                                      controller:
                                                          nameController,
                                                      textAlign: TextAlign.left,
                                                      decoration: InputDecoration(
                                                          hintText: document[
                                                              'humidity'],
                                                          labelText: 'Humidity',
                                                          alignLabelWithHint:
                                                              true),
                                                    ),
                                                  ],
                                                ),
                                                actions: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    child: RaisedButton(
                                                      color: Colors.red,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Undo",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  // Update Button
                                                  RaisedButton(onPressed: () {
                                                    Map<String, dynamic>
                                                        updateFarm = new Map<
                                                            String, dynamic>();
                                                    updateFarm["farmName"] =
                                                        farmController.text;
                                                    updateFarm["location"] =
                                                        nameController.text;
                                                    updateFarm["temparature"] =
                                                        tempController.text;
                                                    updateFarm["humidity"] =
                                                        humidityController.text;

                                                    // Updae Firestore record information regular way
                                                    FirebaseFirestore.instance
                                                        .collection("farms")
                                                        .doc(document.id)
                                                        .update(updateFarm)
                                                        .whenComplete(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                    Text(
                                                      "update",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    );
                                                  }),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      RaisedButton(
                                        color: Colors.yellow[700],
                                        child: Text(
                                          'Recommendations',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                            //
                          });
                    },
                    child: Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: shadowList,
                                  ),
                                  margin: EdgeInsets.only(top: 50),
                                ),
                                Align(
                                  child: Image.asset('assets/images/pt.png'),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 60, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                boxShadow: shadowList,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  new Text(document['farmName'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  //SizedBox(height: 10),
                                  //Text('Location', style: TextStyle(fontSize: 14)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.green[800],
                                      ),
                                      new Text(document['location'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      // subtitle: Center(child: new Text(document['location'])),
                      // trailing:
                      //     // Delete Button
                      //     InkWell(
                      //   onTap: () {
                      //     FirebaseFirestore.instance
                      //         .collection("farms")
                      //         .doc(document.id)
                      //         .delete()
                      //         .catchError((e) {
                      //       print(e);
                      //     });
                      //   },
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 10),
                      //     child: Icon(Icons.delete),
                      //   ),
                      // ),
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
