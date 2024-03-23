import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class AdminPlayerCard1 extends StatelessWidget {
  const AdminPlayerCard1({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _PlayerContainer(context),
          SizedBox(width: w * 0.06),
          _PlayerContainer(context),
          // _PlayerContainer(context),
        ],
      ),
    );
  }

  Widget _PlayerContainer(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: w * 0.6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    "images/adharva.png",
                    width: w * 0.2,
                    height: w * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: w * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFcfcfcf),
                          blurRadius: 1,
                          spreadRadius: 2,
                          offset: Offset(
                            1,
                            3,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Age',
                            style: TextStyle(
                              fontSize: w * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '30',
                            style: TextStyle(
                              fontSize: w * 0.018,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.04),
                  Container(
                    height: w * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFcfcfcf),
                          blurRadius: 1,
                          spreadRadius: 2,
                          offset: Offset(
                            1,
                            3,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Won',
                            style: TextStyle(
                              fontSize: w * 0.020,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '12',
                            style: TextStyle(
                              fontSize: w * 0.018,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.06),
                  Container(
                    height: w * 0.1,
                    width: w * 0.13,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFcfcfcf),
                          blurRadius: 1,
                          spreadRadius: 2,
                          offset: Offset(
                            1,
                            3,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Matches\nPlayed',
                            style: TextStyle(
                              fontSize: w * 0.018,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "15",
                            style: TextStyle(
                              fontSize: w * 0.016,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.04),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'About',
                style: TextStyle(
                  fontSize: w * 0.025,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Atharva',
                style: TextStyle(
                  fontSize: w * 0.025,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "In the  each occupy opposite hal and 8 by 12 metres (26 ft × 39 ft) in case of women.[19] Each has five supplementary players held in reserve for substitution.[19] The game is played with 20-minute halves with a 5-minute half time break in which the teams exchange sides.[19] During each play, known as a raid, a player from the attacking side, known as the raider, runs into the opposing team's side of the court and attempts to tag as many of the seven defending players as possible.",
                style: TextStyle(
                  fontSize: w * 0.02,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your edit button functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFff4e02),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    icon: Icon(
                      Icons.edit,
                      size: w * 0.018,
                    ),
                    label: Text(
                      'Edit',
                      style: TextStyle(fontSize: w * 0.018),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your delete button functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFff4e02),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: w * 0.018,
                    ),
                    label:
                        Text('Delete', style: TextStyle(fontSize: w * 0.018)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
