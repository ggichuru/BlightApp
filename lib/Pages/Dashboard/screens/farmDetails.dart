import 'package:blightclient/Pages/Dashboard/config/configuration.dart';
import 'package:blightclient/Pages/Dashboard/screens/farm.dart';
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
      body: Stack(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        // Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Farm()),
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
              child: Image.asset('assets/images/pt.png'),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.89,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadowList,
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 5),
                        Text('FARM NAME',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.green[800],
                            ),
                            Text('Kinangop, Kenya',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400))
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
                                  label: Text('Parameters',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green))),
                              DataColumn(
                                  label: Text('Details',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green)))
                            ],
                            rows: const <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Temparature',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('24'))
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Humidity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('50'))
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Farm Size',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('100 ha'))
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Planting Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('02/02/2021'))
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Spray interval',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('1 week'))
                              ]),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text('Blight Predictions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 20)),
                          // SizedBox(height: 10),
                          DataTable(
                            columns: const <DataColumn>[
                              DataColumn(
                                  label: Text('Parameters',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green))),
                              DataColumn(
                                  label: Text('Details',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green)))
                            ],
                            rows: const <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Possibility',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('True'))
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Cause',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('1 week'))
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Effects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('1 week'))
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Infection',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('1 week'))
                              ]),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text('Recommendations',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 20)),

                          DataTable(
                            columns: const <DataColumn>[
                              DataColumn(
                                  label: Text('Parameters',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green))),
                              DataColumn(
                                  label: Text('Details',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green)))
                            ],
                            rows: const <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Chemical to use',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('True'))
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Other',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500))),
                                DataCell(Text('1 week'))
                              ]),
                            ],
                          )
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
    );
  }
}
