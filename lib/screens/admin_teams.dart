import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kabadi_admin/components/top_bar.dart";
import "package:kabadi_admin/database/team_services.dart";
import "package:kabadi_admin/screens/team_form.dart";

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

  Stream? teamStream;
  final TeamController _teamController = Get.put(TeamController());

  getTeams() async {
    teamStream = await _teamController.getTeams();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTeams();
  }

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _teamController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Color(0xFFf7f2f0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // searchBar(),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Teams",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    StreamBuilder(
                        stream: teamStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.docs.length > 0) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // final team = teams[index];
                                    final doc = snapshot.data.docs[index];
                                    return TeamButton(
                                      name: doc['name'],
                                      image: doc['logo'],
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
                                      onEdit: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TeamFormScreen(
                                                doc: snapshot.data.docs[index],
                                              ),
                                            ));
                                      },
                                      onDelete: () {
                                        _teamController.deleteTeam(doc["id"]);
                                      },
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Center(
                                child: Text("No teams yet"),
                              );
                            }
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Center(
                              child: Text("Internal error occured"),
                            );
                          }
                        }),
                  ],
                ),
              ),
            );
    });
  }
}

class TeamButton extends StatelessWidget {
  final String name;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TeamButton({
    super.key,
    required this.name,
    required this.image,
    required this.isSelected,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
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
                      child: Image.network(
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
            onPressed: onEdit,
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
              onPressed: onDelete,
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
