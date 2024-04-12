import 'package:flutter/material.dart';

class ReferenceTable extends StatelessWidget {
  const ReferenceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Table(
        defaultColumnWidth: FixedColumnWidth(130.0),
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 2),
        children: const [
          TableRow(children: [
            Column(children: [Text('b*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('Bonus point', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('Touch point', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('tg*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('Tackle Points', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('e*', style: TextStyle(fontSize: 17))]),
            Column(
                children: [Text('Empty Raid', style: TextStyle(fontSize: 17))]),
          ]),
          TableRow(children: [
            Column(children: [Text('o*', style: TextStyle(fontSize: 17))]),
            Column(children: [Text('Out', style: TextStyle(fontSize: 17))]),
          ]),
          TableRow(children: [
            Column(children: [Text('tp*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('Technical point', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('ap*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('Allout Points', style: TextStyle(fontSize: 17))
            ]),
          ]),
        ],
      ),
      SizedBox(
        width: 30,
      ),
      Table(
        defaultColumnWidth: FixedColumnWidth(130.0),
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 2),
        children: const [
          TableRow(children: [
            Column(children: [Text('bt', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('Bonus Point', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('b2t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('Touch Point', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('b3t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('Tackle point', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('b4t*', style: TextStyle(fontSize: 17))]),
            Column(
                children: [Text('Empty raid', style: TextStyle(fontSize: 17))]),
          ]),
          TableRow(children: [
            Column(children: [Text('b5t*', style: TextStyle(fontSize: 17))]),
            Column(children: [Text('Out', style: TextStyle(fontSize: 17))]),
          ]),
          TableRow(children: [
            Column(children: [Text('b6t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('technical point', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('b7t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('all out points', style: TextStyle(fontSize: 17))
            ]),
          ]),
        ],
      ),
      SizedBox(
        width: 30,
      ),
      Table(
        defaultColumnWidth: FixedColumnWidth(130.0),
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 2),
        children: const [
          TableRow(children: [
            Column(children: [Text('t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('1 touch point', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('2t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('2 touch points', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('3t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('3 touch points', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('4t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('4touch points', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('5t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('5 touch points', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('6t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('6 touch points', style: TextStyle(fontSize: 17))
            ]),
          ]),
          TableRow(children: [
            Column(children: [Text('7t*', style: TextStyle(fontSize: 17))]),
            Column(children: [
              Text('7 touch points', style: TextStyle(fontSize: 17))
            ]),
          ]),
        ],
      ),
    ]);
  }
}
