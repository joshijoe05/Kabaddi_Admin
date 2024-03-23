import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Visitors1()));
}

class Visitors1 extends StatefulWidget {
  const Visitors1({Key? key}) : super(key: key);

  @override
  State<Visitors1> createState() => _VisitorsState();
}

class _VisitorsState extends State<Visitors1> {
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Visitors",
            style: TextStyle(fontSize: w * 0.025),
          ),
          SizedBox(height: w * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < 2; i++) ...{
                VisitorsCard(visitorsList[i]['name'], visitorsList[i]['image'],
                    visitorsList[i]['count'], context),
                SizedBox(
                  height: w * 0.335,
                  width: w * 0.02,
                ),
              }
            ],
          ),
          SizedBox(
            height: w * 0.02,
          ),
          Row(
            //
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 2; i < 4; i++) ...{
                VisitorsCard(visitorsList[i]['name'], visitorsList[i]['image'],
                    visitorsList[i]['count'], context),
                SizedBox(
                  width: w * 0.02,
                ),
              }
            ],
          ),
          SizedBox(
            height: w * 0.02,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            VisitorsCard(visitorsList[4]['name'], visitorsList[4]['image'],
                visitorsList[4]['count'], context),
          ]),
          SizedBox(
            height: w * 0.1,
            width: w * 0.0,
          ),
        ],
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
            height: w * 0.015,
          ),
          Image.asset(
            image,
            width: w * 0.05,
            height: w * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              name,
              style: TextStyle(color: Color(0xFF7589d8), fontSize: w * 0.015),
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: w * 0.025,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFfc5607),
            ),
          )
        ],
      ),
    );

    //////////////////////////
    ///
  }
}
