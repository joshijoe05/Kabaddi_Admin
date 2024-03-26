import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabadi_admin/components/playerCard.dart';
import 'package:kabadi_admin/components/top_bar.dart';
import 'package:kabadi_admin/database/player_services.dart';
import 'package:kabadi_admin/database/team_services.dart';

class AdminPlayers extends StatefulWidget {
  const AdminPlayers({super.key});

  @override
  State<AdminPlayers> createState() => _AdminPlayersState();
}

class _AdminPlayersState extends State<AdminPlayers> {
  Rx<List<Map<String, String>>> teamList = Rx<List<Map<String, String>>>([]);
  final PlayerController _playerController = Get.put(PlayerController());

  getTeams() async {
    teamList.value.add({"name": "All Players"});
    var teamListtemp = await _playerController.getTeamDetails();
    teamList.value.addAll(teamListtemp);
    teamList.refresh();
  }

  Stream? playerStream;

  getPlayers() async {
    playerStream = await _playerController.getPlayers();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teamList.value.clear();
    getTeams();
    getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Obx(() {
        return _playerController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // searchBar(),
                  DropdownMenu(
                    onSelected: (value) async {
                      if (value == "All Players") {
                        playerStream = await _playerController.getPlayers();
                      } else {
                        playerStream =
                            await _playerController.getPlayersByTeam(value!);
                      }
                    },
                    width: MediaQuery.of(context).size.width / 2,
                    dropdownMenuEntries: teamList.value.map((e) {
                      return DropdownMenuEntry(
                          value: e['name'], label: e['name']!);
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Players",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24),
                  ),
                  StreamBuilder(
                    stream: playerStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.docs.length > 0) {
                          return Expanded(
                            child: GridView.builder(
                              itemCount: snapshot.data.docs.length,
                              // itemCount: 10,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisExtent:
                                    MediaQuery.sizeOf(context).height / 1.5,
                              ),
                              itemBuilder: (context, index) {
                                final player = snapshot.data.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: PlayerCard(
                                    image: player["imageUrl"],
                                    name: player["name"],
                                    teamName: player["teamName"],
                                    jerseyNo: player["jerseyNo"],
                                    age: player["age"],
                                    matchesPlayed: player["matchesPlayed"],
                                    points: player["points"],
                                    about: player["about"],
                                    teamList: teamList.value,
                                    doc: player,
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return Center(
                            child: Text("No players yet"),
                          );
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(child: Text("Internal Error"));
                      }
                    },
                  ),
                ],
              );
      }),
    );
  }
}
