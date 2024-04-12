import 'package:get/get.dart';
import 'package:kabadi_admin/database/matched_services.dart';

class MatchPointController extends GetxController {
  RxList<MatchPlayer> matchPlayers = RxList<MatchPlayer>([]);
  RxList<KabbadiMatch> teams = RxList<KabbadiMatch>([]);
  addPlayers() {
    for (int i = 0; i < 24; i++) {
      matchPlayers.add(MatchPlayer(
          playerName: 'P${i+1}',
          teamName: 'Team $i',
          playerId: 'playerId $i',
          teamId: 'teamId $i',
          points: []));
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}

class MatchPlayer {
  String playerName;
  String teamName;
  String playerId;
  String teamId;
  List<PointsOfPlayer> points = [];

  MatchPlayer(
      {required this.playerName,
      required this.teamName,
      required this.playerId,
      required this.teamId,
      required this.points});

  MatchPlayer.fromFirestore(Map<String, dynamic> data)
      : playerName = data['playerName'],
        teamName = data['teamName'],
        playerId = data['playerId'],
        teamId = data['teamId'],
        points = data['points'];
}

class PointsOfPlayer {
  String? round;
  String? type;
}
