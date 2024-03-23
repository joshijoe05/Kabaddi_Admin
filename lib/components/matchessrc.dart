import 'package:flutter/material.dart';

class Border extends StatelessWidget {
  const Border({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildMatchContainer(),
          _buildMatchGroup(),
        ],
      ),
    );
  }
}

Widget _buildMatchGroup() {
  return Container(
    color: const Color(0xFFfc5607),
    margin: const EdgeInsets.all(12),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              // children: matches.map((match) {
              //   return _buildMatchContainer(match);
              children:
                  {_buildMatchContainer(), _buildMatchContainer2()}.toList()

              // }).toList(),
              ),
        ],
      ),
    ),
  );
}

Widget _buildMatchContainer() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Text(
                'Tamil Thalaivas',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'images/tamilThalaivas.png',
              height: 70,
              width: 70,
            ),
            const Center(
              child: Text(
                "Match 1 \n 9:00\n  IST",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'images/gujarat.png',
              height: 70,
              width: 70,
            ),
            const Expanded(
                child: Text(
              'Gujarat Giants',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    ),
  );
}

Widget _buildMatchContainer2() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Text(
                'Tamil Thalaivas',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'images/tamilThalaivas.png',
              height: 70,
              width: 70,
            ),
            const Center(
              child: Text(
                "Match 1 \n 9:00\n  IST",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'images/gujarat.png',
              height: 70,
              width: 70,
            ),
            const Expanded(
                child: Text(
              'Gujarat Giants',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    ),
  );
}
