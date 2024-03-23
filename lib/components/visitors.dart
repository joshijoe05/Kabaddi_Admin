import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Visitors()));
}

class Visitors extends StatefulWidget {
  const Visitors({Key? key}) : super(key: key);

  @override
  State<Visitors> createState() => _VisitorsState();
}

class _VisitorsState extends State<Visitors> {
  final List<Map<String, dynamic>> visitorsList = [
    {"name": "Total Post", "image": "images/page.png", "count": "154"},
    {"name": "Total Pages", "image": "images/website.png", "count": "56"},
    {"name": "Comments", "image": "images/comment.png", "count": "34,652"},
    {"name": "Total Likes", "image": "images/like.png", "count": "65.2K"},
    {"name": "Subscribe", "image": "images/subscribe.png", "count": "23K"}
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Visitors",
              style: TextStyle(fontSize: w * 0.018),
            ),
            SizedBox(height: w * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var i = 0; i < 3; i++) ...{
                  VisitorsCard(
                      visitorsList[i]['name'],
                      visitorsList[i]['image'],
                      visitorsList[i]['count'],
                      context),
                }
              ],
            ),
            SizedBox(height: w * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 3; i < 5; i++) ...{
                  VisitorsCard(
                      visitorsList[i]['name'],
                      visitorsList[i]['image'],
                      visitorsList[i]['count'],
                      context),
                }
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget VisitorsCard(
      String name, String image, String count, BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 5,
              color: Colors.grey.shade300,
              offset: const Offset(-2, 5),
            ),
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey.shade300,
              offset: const Offset(2, 5),
            )
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: w * 0.01,
          ),
          Image.asset(
            image,
            width: w * 0.02,
            height: w * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              name,
              style: TextStyle(color: Color(0xFF7589d8), fontSize: w * 0.012),
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: w * 0.012,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFfc5607),
            ),
          )
        ],
      ),
    );
  }
}
