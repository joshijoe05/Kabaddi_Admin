import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kabadi_admin/components/top_bar.dart';

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
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    List<Match> matches = [
      // Match(
      //   team1Name: 'Danbang Delhi K.C',
      //   team1Logo: 'images/danbang.png',
      //   team2Name: 'Jaipur Pink Panters',
      //   team2Logo: 'images/punneriPaltan.png',
      //   matchNumber: '1',
      //   matchTime: '8:30',
      //   matchDate: 'Octomber 18 2024',
      // ),
      Match(
        team1Name: 'Tamil Thalaivas',
        team1Logo: 'images/tamilThalaivas.png',
        team2Name: 'Gujarat Giants',
        team2Logo: 'images/gujarat.png',
        matchNumber: '2',
        matchTime: '9:00',
        matchDate: 'December 24 2024',
      ),
      Match(
        team1Name: 'Bangaluru Bulls',
        team1Logo: 'images/bengaluru.png',
        team2Name: 'Bengal Warriors',
        team2Logo: 'images/bengal.png',
        matchNumber: '3',
        matchTime: '10:00',
        matchDate: 'December 24 2024',
      ),
    ];

    // Group matches by date
    Map<String, List<Match>> groupedMatches = {};
    for (var match in matches) {
      if (groupedMatches.containsKey(match.matchDate)) {
        groupedMatches[match.matchDate]!.add(match);
      } else {
        groupedMatches[match.matchDate] = [match];
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const searchBar(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: h / 80, horizontal: w / 80),
          child: Text(
            'Matches',
            style: TextStyle(
                fontSize: w / 60,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: h / 60,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: w * 0.38,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 80),
                    child: Text(
                      'Tournament',
                      style: TextStyle(
                          fontSize: w / 80,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upcoming Matches',
                        style: TextStyle(
                            fontSize: w / 80,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: groupedMatches.entries.map((entry) {
                          return _buildMatchGroup(
                              entry.key, entry.value, context);
                        }).toList(),
                      ),
                      SizedBox(
                        height: h / 80,
                      ),
                      Container(
                        color: const Color.fromARGB(255, 231, 226, 224),
                        margin: EdgeInsets.all(h / 90),
                        child: Padding(
                          padding: EdgeInsets.all(h / 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'October 19,2024',
                                style: TextStyle(
                                    fontSize: w * 0.012,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Bangaluru',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * 0.012),
                                    ),
                                  ),
                                  Image.asset(
                                    'images/adharva.png',
                                    height: w * 0.04,
                                    width: w * 0.04,
                                  ),
                                  Center(
                                    child: Text(
                                      "Match 64\n 19.30\n  IST",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * 0.012),
                                    ),
                                  ),
                                  Image.asset(
                                    'images/adharva.png',
                                    width: w * 0.04,
                                    height: w * 0.04,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Bengal \n Warriors',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * 0.012),
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: w * 0.01, top: 0.005),
                            child: SizedBox(
                              height: w * 0.03,
                              width: w * 0.09,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  backgroundColor: const Color(0xFFfc5607),
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit_outlined,
                                  size: w * 0.010,
                                ),
                                label: Text(
                                  'Edit',
                                  style: TextStyle(fontSize: w * 0.01),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: w * 0.006,
                                top: w * 0.002,
                                right: w * 0.02),
                            child: SizedBox(
                              height: w * 0.03,
                              width: w * 0.09,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  backgroundColor: const Color(0xFFfc5607),
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_outline_outlined,
                                  size: w * 0.010,
                                ),
                                label: Text(
                                  'Delete',
                                  style: TextStyle(fontSize: w * 0.01),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMatchGroup(
      String matchDate, List<Match> matches, BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: const Color(0xFFfc5607),
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: EdgeInsets.all(w * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: matches.map((match) {
                return _buildMatchContainer(match, context);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchContainer(Match match, BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w * 0.01),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  match.team1Name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.012),
                ),
              ),
              Image.asset(
                match.team1Logo,
                height: w * 0.04,
                width: w * 0.04,
              ),
              Center(
                child: Text(
                  "Match ${match.matchNumber}\n ${match.matchTime}\n  IST",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.012),
                ),
              ),
              Image.asset(
                match.team2Logo,
                height: w * 0.04,
                width: w * 0.04,
              ),
              Expanded(
                child: Text(
                  match.team2Name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.012),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
