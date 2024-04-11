import 'package:flutter/material.dart';

class Matchpoints extends StatefulWidget {
  const Matchpoints({super.key});

  @override
  State<Matchpoints> createState() => _MatchpointsState();
}

class _MatchpointsState extends State<Matchpoints> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Container(
              child: DataTable(
                  border: TableBorder.all(color: Colors.black),
                  columns: [DataColumn(label: Text('player'))],
                  rows: List.generate(12, (index) {
                    return DataRow(cells: [DataCell(Text('P$index'))]);
                  })),
            ),
            Container(
              // width: MediaQuery.sizeOf(context).width * 0.7,
              color: Colors.white,
              child: Expanded(
                child: DataTable(
                    horizontalMargin: 10,
                    columnSpacing: 20,
                    dataRowHeight: 24,
                    border: TableBorder.all(color: Colors.black),
                    columns: const [
                      DataColumn(label: Text('01')),
                      DataColumn(label: Text('02')),
                      DataColumn(label: Text('03')),
                      DataColumn(label: Text('04')),
                      DataColumn(label: Text('05')),
                      DataColumn(label: Text('06')),
                      DataColumn(label: Text('07')),
                      DataColumn(label: Text('08')),
                      DataColumn(label: Text('09')),
                      DataColumn(label: Text('10')),
                      DataColumn(label: Text('11')),
                      DataColumn(label: Text('12')),
                      DataColumn(label: Text('13')),
                      DataColumn(label: Text('14')),
                      DataColumn(label: Text('15')),
                      DataColumn(label: Text('16')),
                      DataColumn(label: Text('17')),
                      DataColumn(label: Text('18')),
                      DataColumn(label: Text('19')),
                      DataColumn(label: Text('20')),
                      DataColumn(label: Text('21')),
                      DataColumn(label: Text('22')),
                      DataColumn(label: Text('23')),
                      DataColumn(label: Text('24')),
                      DataColumn(label: Text('Team')),
                      DataColumn(label: Text('Points')),
                    ],
                    rows: List.generate(24, (index) {
                      return const DataRow(cells: [
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                      ]);
                    })),
              ),
            ),
            Container(
              child: DataTable(
                  columnSpacing: 25,
                  border: TableBorder.all(color: Colors.black),
                  columns: [
                    DataColumn(label: Text('b')),
                    DataColumn(label: Text('t')),
                    DataColumn(label: Text('bt')),
                    DataColumn(label: Text('tg')),
                    DataColumn(label: Text('e')),
                    DataColumn(label: Text('0'))
                  ],
                  rows: List.generate(12, (index) {
                    return DataRow(cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text(''))
                    ]);
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
