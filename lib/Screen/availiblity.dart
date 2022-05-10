// import 'package:Myclinic/utilites/appbar.dart';
// import 'package:Myclinic/utilites/bottomnavigationbar.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/bottomnavigationbar.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/style.dart';

class AvaliblityPage extends StatefulWidget {
  AvaliblityPage({Key key}) : super(key: key);

  @override
  _AvaliblityPageState createState() => _AvaliblityPageState();
}

class _AvaliblityPageState extends State<AvaliblityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBars().bottomNavigationBar(
          context, "Book an appointment", '/AppoinmentPage'),
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AppBars().commonAppBar(context, "Availability"),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Text(
                        "We are available on",
                        style: kTitleStyle3,
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: _table()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _table() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Day',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans-SemiBold',
              fontSize: 15.0,
            ),
          ),
        ),
        DataColumn(
          label: Text('Time',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans-SemiBold',
                fontSize: 15.0,
              )),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Monday')),
            DataCell(Text('9 AM - 7 PM')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Tuesday')),
            DataCell(Text('9 AM - 7 PM')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Wednesday')),
            DataCell(Text('9 AM - 7 PM')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Thusday')),
            DataCell(Text('9 AM - 7 PM')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Friday')),
            DataCell(Text('9 AM - 7 PM')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Saturday')),
            DataCell(Text('9 AM - 7 PM')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sunday')),
            DataCell(Text('Holiday')),
          ],
        ),
      ],
    );
  }
}
