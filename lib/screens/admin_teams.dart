import "package:flutter/material.dart";
import "package:kabadi_admin/components/top_bar.dart";

void main() {
  runApp(const MaterialApp(home: AdminTeamsPage()));
}

class AdminTeamsPage extends StatefulWidget {
  const AdminTeamsPage({super.key});

  @override
  State<AdminTeamsPage> createState() => _AdminTeamsPageState();
}

class _AdminTeamsPageState extends State<AdminTeamsPage> {
  final List<Map<String, dynamic>> teams = [
    {"name": "Bengal Warriors", "image": "images/bengal.png"},
    {"name": "Bengaluru Bulls", "image": "images/bengaluru.png"},
    {"name": "Dabang Delhi K.C", "image": "images/danbang.png"},
    {"name": "Gujarat Giants", "image": "images/gujarat.png"},
    {"name": "Tamil Thalaivas", "image": "images/tamilThalaivas.png"},
    {"name": "PunneriPaltan", "image": "images/punneriPaltan.png"},
    {"name": "Bengal Warriors", "image": "images/bengal.png"},
    {"name": "Bengaluru Bulls", "image": "images/bengaluru.png"},
    {"name": "Dabang Delhi K.C", "image": "images/danbang.png"},
    {"name": "Gujarat Giants", "image": "images/gujarat.png"},
    {"name": "Tamil Thalaivas", "image": "images/tamilThalaivas.png"},
    {"name": "PunneriPaltan", "image": "images/punneriPaltan.png"},
    // Add more teams here as needed
  ];

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf7f2f0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar(),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Teams",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: teams.length,
                itemBuilder: (BuildContext context, int index) {
                  final team = teams[index];
                  return TeamButton(
                    name: team['name'],
                    image: team['image'],
                    isSelected: selectedIndex ==
                        index, // Set isSelected based on selectedIndex
                    onTap: () {
                      setState(() {
                        // Update selectedIndex when a team is tapped
                        selectedIndex = index;
                      });
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeamDetails()),
                      );*/
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamButton extends StatelessWidget {
  final String name;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const TeamButton({
    super.key,
    required this.name,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: w * 0.04,
                width: w * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: isSelected ? const Color(0xFFfc5607) : Colors.white,
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
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.012),
                      child: Image.asset(
                        image,
                        height: w * 0.1,
                        width: w * 0.1,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    SizedBox(width: w * 0.014),
                    Text(
                      name,
                      style: TextStyle(
                        color:
                            isSelected ? Colors.white : const Color(0xFF325177),
                        fontSize: w * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: w * 0.03,
          width: w * 0.1,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isSelected ? const Color(0xFFfc5607) : Colors.white,
              foregroundColor:
                  isSelected ? Colors.white : const Color(0xFF325177),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: isSelected
                  ? const BorderSide(color: Color(0xFFfc5607))
                  : const BorderSide(color: Colors.red),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.edit,
                    size: w * 0.02,
                  ),
                ),
                Text(
                  "Edit",
                  style: TextStyle(fontSize: w * 0.01),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: w * 0.03,
            width: w * 0.1,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isSelected ? const Color(0xFFfc5607) : Colors.white,
                foregroundColor:
                    isSelected ? Colors.white : const Color(0xFF325177),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: isSelected
                    ? const BorderSide(color: Color(0xFFfc5607))
                    : const BorderSide(color: Colors.red),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: isSelected ? Colors.white : Colors.red,
                    size: w * 0.02,
                  ),
                  Text(
                    "Delete",
                    style: TextStyle(fontSize: w * 0.01),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
