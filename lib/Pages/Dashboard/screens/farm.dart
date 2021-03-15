import 'package:blightclient/Pages/Dashboard/config/configuration.dart';
import 'package:blightclient/Pages/Dashboard/screens/farmDetails.dart';
import 'package:flutter/material.dart';

class Farm extends StatefulWidget {
  @override
  _FarmState createState() => _FarmState();
}

class _FarmState extends State<Farm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Farms',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800])),
                  ],
                ),
              ),
              Column(
                  children: [
                    containerItems(
                      'KIGOI FARM',
                      'Kinangop, Kenya',
                      '2400 ha'
                    ),
                    containerItems(
                      'Kanunu Farm',
                      'Chaka, Kenya',
                      '1800 ha'
                    ),
                    containerItems(
                      'Gicheru Farm',
                      'Narumoro, Kenya',
                      '1800 ha'
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector containerItems(
      String farmName, String farmLocation, String farmSize,) {
    return GestureDetector(
      onTap: () {
        FarmDetails();
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
                    child: Hero(
                        tag: 1, child: Image.asset('assets/images/pt.png')),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 60, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadowList,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(farmName, style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                    //SizedBox(height: 10),
                    //Text('Location', style: TextStyle(fontSize: 14)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.green[800],
                        ),
                        Text(farmLocation,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Farm Size: ', style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300)),
                        Text(farmSize),
                      ],
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
