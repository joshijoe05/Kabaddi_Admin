import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kabadi_admin/components/top_bar.dart';
import 'package:kabadi_admin/database/common_services.dart';
import 'package:kabadi_admin/database/matched_services.dart';
import 'package:kabadi_admin/screens/custom_table.dart';
import 'package:kabadi_admin/screens/table.dart';

void main() {
  runApp(MaterialApp(home: Upcoming()));
}

// ignore: must_be_immutable
class Upcoming extends StatefulWidget {
  Upcoming({Key? key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  // ignore: use_key_in_widget_constructors
  MatchesController matchesController = Get.put(MatchesController());

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    List<KabbadiMatch> matches = [
      // Match(
      //   team1Name: 'Danbang Delhi K.C',
      //   team1Logo: 'images/danbang.png',
      //   team2Name: 'Jaipur Pink Panters',
      //   team2Logo: 'images/punneriPaltan.png',
      //   matchNumber: '1',
      //   matchTime: '8:30',
      //   matchDate: 'Octomber 18 2024',
      // ),
      KabbadiMatch(
        team1Name: 'Tamil Thalaivas',
        team1Logo: 'images/tamilThalaivas.png',
        team2Name: 'Gujarat Giants',
        team2Logo: 'images/gujarat.png',
        matchNumber: '2',
        matchTime: '9:00',
        matchDate: 'December 24 2024',
      ),
      KabbadiMatch(
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
    Map<String, List<KabbadiMatch>> groupedMatches = {};
    for (var match in matches) {
      if (groupedMatches.containsKey(match.matchDate)) {
        groupedMatches[match.matchDate]!.add(match);
      } else {
        groupedMatches[match.matchDate] = [match];
      }
    }

    late String dateOfMatch;
    late String timeOfMatch;

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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Tournament For Approved',
                              style: GoogleFonts.poppins(
                                fontSize: w / 80,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Obx(
                          () => Container(
                            height: h * 0.3,
                            padding: EdgeInsets.symmetric(vertical: h * 0.007),
                            decoration: BoxDecoration(
                              color: const Color(0xFFfc5607),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListView.builder(
                                itemCount:
                                    matchesController.approvedMatches.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.01,
                                        vertical: h * 0.01),
                                    child: _approvedTournaments(
                                        context,
                                        index.toString(),
                                        matchesController
                                            .approvedMatches[index]),
                                  );
                                }),
                          ),
                        ),
                        CommonServices.userRole == "admin"
                            ? Row(
                                children: [
                                  Text(
                                    'Tournament For Approved',
                                    style: GoogleFonts.poppins(
                                      fontSize: w / 80,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Text(
                                    'Tournaments Waiting For Approval',
                                    style: GoogleFonts.poppins(
                                      fontSize: w / 80,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Container(
                          height: h * 0.3,
                          padding: EdgeInsets.symmetric(vertical: h * 0.007),
                          decoration: BoxDecoration(
                            color: const Color(0xFFfc5607),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.01, vertical: h * 0.01),
                                  child: waitingForApprovalRefreeWidget(
                                      context,
                                      matches[index],
                                      CommonServices.userRole == "admin"),
                                );
                              }),
                        ),
                      ],
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
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 231, 226, 224),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(h / 90),
                        child: Padding(
                          padding: EdgeInsets.all(h / 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await showDatePicker(
                                          context: context,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2101),
                                          initialDate: DateTime.now())
                                      .then((dateTime) async {
                                    print(dateTime);
                                    setState(() {
                                      dateOfMatch =
                                          "${dateTime?.year}-${dateTime?.month.toString().padLeft(2, '0')}-${dateTime?.day.toString().padLeft(2, '0')}";
                                    });
                                    print(dateOfMatch);
                                    await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      setState(() {
                                        timeOfMatch =
                                            "${value?.hour}:${value?.minute}";
                                      });
                                      print(timeOfMatch);
                                    });
                                  });
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Select Date And Time',
                                    style: TextStyle(
                                        fontSize: w * 0.012,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
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

  Widget _approvedTournaments(
      BuildContext context, String index, KabbadiMatch match) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.1,
      width: w * 0.35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: w * 0.01),
            child: SizedBox(
              width: w * 0.06,
              child: Expanded(
                child: Text(
                  match.team1Name,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
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
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Image.asset(
            match.team2Logo,
            height: w * 0.04,
            width: w * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(left: w * 0.01),
            child: SizedBox(
              width: w * 0.06,
              child: Expanded(
                child: Text(
                  match.team2Name,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: w * 0.01),
            child: Container(
              height: h * 0.04,
              width: w * 0.07,
              decoration: BoxDecoration(
                color: const Color(0xFFfc5607),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "View Match",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMatchGroup(
      String matchDate, List<KabbadiMatch> matches, BuildContext context) {
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

  Widget _buildMatchContainer(KabbadiMatch match, BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w * 0.01),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Matchpoints(match: match)));
        },
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
      ),
    );
  }
}

Widget waitingForApprovalRefreeWidget(
    BuildContext context, KabbadiMatch match, bool isAdmin) {
  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;

  return Container(
    height: h * 0.1,
    width: w * 0.35,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: w * 0.01),
          child: SizedBox(
            width: w * 0.06,
            child: Expanded(
              child: Text(
                match.team1Name,
                overflow: TextOverflow.clip,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
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
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Image.asset(
          match.team2Logo,
          height: w * 0.04,
          width: w * 0.04,
        ),
        Padding(
          padding: EdgeInsets.only(left: w * 0.01),
          child: SizedBox(
            width: w * 0.06,
            child: Expanded(
              child: Text(
                match.team2Name,
                overflow: TextOverflow.clip,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        isAdmin
            ? Padding(
                padding: EdgeInsets.only(right: w * 0.01),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        MatchesController().approveMatch(match.matchNumber);
                      },
                      child: Container(
                        height: h * 0.04,
                        width: w * 0.035,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfc5607),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Approve",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: w * 0.005,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: h * 0.04,
                      width: w * 0.035,
                      decoration: BoxDecoration(
                        color: const Color(0xFFfc5607),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Reject",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: w * 0.005,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.only(right: w * 0.01),
                child: Container(
                  height: h * 0.04,
                  width: w * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xFFfc5607),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Waiting For Approval",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
      ],
    ),
  );
}
