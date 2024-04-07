import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kabadi_admin/database/common_services.dart';

class MatchesController extends GetxController {
  bool isAdmin = CommonServices.userRole == "admin";

  RxList<Match> allMatches = RxList<Match>([]);
  late Rx<Match> realTimeMatchUpdates;

  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    allMatches.bindStream(MatchesServices().getMatches());
    ever(allMatches, (callback) => {print(callback.length)});
  }

  Future<void> addMatch(Match match) async {
    try {
      isLoading.value = true;
      await MatchesServices().addMatch(match);
      isLoading.value = false;
    } catch (e) {
      print(e);
      Get.snackbar(
          "Error Occured While Adding the mathch", "Please try again later");
    }
  }

  attachARealTimeMatch(String id) async {
    isLoading.value = true;
    realTimeMatchUpdates
        .bindStream(MatchesServices().getMatchByIdInReatlTime(id));
    isLoading.value = false;
  }

  detachRealTimeMatch() {
    realTimeMatchUpdates.close();
  }
}

class Match {
  String team1Name;
  String team1Logo;
  String team2Name;
  String team2Logo;
  String matchNumber;
  String matchTime;
  String matchDate;
  bool isApproved = false;
  int team1Score = 0;
  int team2Score = 0;

  Match({
    required this.team1Name,
    required this.team1Logo,
    required this.team2Name,
    required this.team2Logo,
    required this.matchNumber,
    required this.matchTime,
    required this.matchDate,
  });

  // From Firestore
  Match.fromFirestore(Map<String, dynamic> data)
      : team1Name = data['team1Name'],
        team1Logo = data['team1Logo'],
        team2Name = data['team2Name'],
        team2Logo = data['team2Logo'],
        matchNumber = data['matchNumber'],
        matchTime = data['matchTime'],
        matchDate = data['matchDate'],
        isApproved = data['isApproved'],
        team1Score = data['team1Score'],
        team2Score = data['team2Score'];
}

class MatchesServices {
  final CollectionReference _matchesCollectionReference =
      FirebaseFirestore.instance.collection("Matches");

  Stream<List<Match>> getMatches() {
    return _matchesCollectionReference.snapshots().map((snapshot) => snapshot
        .docs
        .map((doc) => Match.fromFirestore(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> addMatch(Match match) async {
    try {
      await _matchesCollectionReference.add({
        'team1Name': match.team1Name,
        'team1Logo': match.team1Logo,
        'team2Name': match.team2Name,
        'team2Logo': match.team2Logo,
        'matchNumber': match.matchNumber,
        'matchTime': match.matchTime,
        'matchDate': match.matchDate,
        'isApproved': match.isApproved,
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<Match> getMatchByIdInReatlTime(String id) {
    return _matchesCollectionReference
        .doc(id)
        .snapshots()
        .map((doc) => Match.fromFirestore(doc.data() as Map<String, dynamic>));
  }
}
