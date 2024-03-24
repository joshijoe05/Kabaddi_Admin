import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TeamController {
  bool isAdmin = true;

  Rx<bool> isLoading = false.obs;

  // Team Model
  /*  Tha map of data you send from frontend should be of this format
    Team - {
      name : team name
      logo : image url
      id : team id    // i will add this while uploading to db
    }
   */

  Future<void> addteam(Map<String, dynamic> data) async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;

      final teams = await FirebaseFirestore.instance.collection("Teams").get();
      final len = teams.docs.length;
      data["id"] = "Team $len";
      await FirebaseFirestore.instance
          .collection("Teams")
          .doc('Team $len')
          .set(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<Stream<QuerySnapshot>?> getTeams() async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return null;
      }
      isLoading.value = true;

      return await FirebaseFirestore.instance.collection("Teams").snapshots();
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTeam(String id, Map<String, dynamic> data) async {
    // if the image is modified then upload it using uploadToStorage function and then send its url in the data (map)
    // upload image with existing id only !
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;

      await FirebaseFirestore.instance.collection("Teams").doc(id).update(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }

    Future<void> deleteTeam(String id) async {
      try {
        if (!isAdmin) {
          Get.snackbar("Not Authorized", "You dont have access");
          return;
        }
        isLoading.value = true;

        await FirebaseFirestore.instance.collection("Teams").doc(id).delete();
      } catch (e) {
        Get.snackbar("Error", e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }
}
