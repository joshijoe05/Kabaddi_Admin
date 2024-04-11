import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Upcoming()));
}

class Match {
  String team1Name;
  String team1Logo;
  String team2Name;
  String team2Logo;
  String matchNumber;
  String matchTime;
  String matchDate;

  Match({
    required this.team1Name,
    required this.team1Logo,
    required this.team2Name,
    required this.team2Logo,
    required this.matchNumber,
    required this.matchTime,
    required this.matchDate,
  });
}

// ignore: must_be_immutable
class Upcoming extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  Upcoming({Key? key});

  List<Match> matches = [
    Match(
      team1Name: 'Danbang Delhi K.C',
      team1Logo: 'assets/danbang.png',
      team2Name: 'Punneri Paltan',
      team2Logo: 'assets/punneriPaltan.png',
      matchNumber: '1',
      matchTime: '8:30',
      matchDate: 'Octomber 18 2024',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Group matches by date
    Map<String, List<Match>> groupedMatches = {};
    for (var match in matches) {
      if (groupedMatches.containsKey(match.matchDate)) {
        groupedMatches[match.matchDate]!.add(match);
      } else {
        groupedMatches[match.matchDate] = [match];
      }
    }

    return ListView(
      shrinkWrap: true,
      children: groupedMatches.entries.map((entry) {
        return _buildMatchGroup(entry.key, entry.value);
      }).toList(),
    );
  }

  Widget _buildMatchGroup(String matchDate, List<Match> matches) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(30),
          color: Color(0xFFfc5607)),
      // color: const Color(0xFFfc5607),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: matches.map((match) {
                return _buildMatchContainer(match);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchContainer(Match match) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20),
            color: Color.fromARGB(255, 255, 255, 255)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  match.team1Name,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset(
                match.team1Logo,
                height: 70,
                width: 70,
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Center(
                        child: Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    )),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFfc5607), shape: BoxShape.circle),
                  ),
                  Text('Total Score',
                      style: TextStyle(color: Colors.grey, fontSize: 16))
                ],
              ),
              Center(
                child: Text(
                  "Match ${match.matchNumber}\n ${match.matchTime}\n  IST",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Center(
                        child: Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    )),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFfc5607), shape: BoxShape.circle),
                  ),
                  Text('Total Score',
                      style: TextStyle(color: Colors.grey, fontSize: 16))
                ],
              ),
              Image.asset(
                match.team2Logo,
                height: 70,
                width: 70,
              ),
              Expanded(
                  child: Text(
                match.team2Name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
