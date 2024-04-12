import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kabadi_admin/database/matched_services.dart';
import 'package:kabadi_admin/screens/admin_matches.dart';
import 'package:kabadi_admin/screens/table.dart';

class Matchpoints extends StatefulWidget {
  final KabbadiMatch match;
  const Matchpoints({super.key, required this.match});

  @override
  State<Matchpoints> createState() => _MatchpointsState();
}

class _MatchpointsState extends State<Matchpoints> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Match Points',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFfc5607),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.match.team1Name,
                              style: TextStyle(fontSize: 20),
                            ),
                            Image.asset(
                              widget.match.team1Logo,
                              height: w * 0.04,
                              width: w * 0.04,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.07,
                              decoration: const BoxDecoration(
                                color: Color(0xFFfc5607),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  widget.match.team1Score.toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.07,
                              decoration: const BoxDecoration(
                                color: Color(0xFFfc5607),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  widget.match.team2Score.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Image.asset(
                              widget.match.team2Logo,
                              height: w * 0.04,
                              width: w * 0.04,
                            ),
                            Text(
                              widget.match.team2Name,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.038,
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
                      rows: [
                        ...createRowForPlayer('P1'),
                        ...createRowForPlayer('P2'),
                        ...createRowForPlayer('P3'),
                        ...createRowForPlayer('P4'),
                        ...createRowForPlayer('P5'),
                        ...createRowForPlayer('P6'),
                        ...createRowForPlayer('P7'),
                        ...createRowForPlayer('P8'),
                        ...createRowForPlayer('P9'),
                        ...createRowForPlayer('P10'),
                        ...createRowForPlayer('P11'),
                        ...createRowForPlayer('P12'),
                      ]),
                ),
                DataTable(
                    columnSpacing: 25,
                    border: TableBorder.all(color: Colors.black),
                    columns: const [
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
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const ReferenceTable(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}

List<DataRow> createRowForPlayer(String player) {
  return [
    row(player),
    row(player),
  ];
}

DataRow row(String player) {
  return DataRow(cells: [
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text(player)),
    DataCell(Text("T")),
    DataCell(Text("0")),
  ]);
}
