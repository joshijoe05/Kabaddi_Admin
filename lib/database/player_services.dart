import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PlayerController {
  Rx<bool> isLoading = false.obs;
  bool isAdmin = true;

  // Player Model
  /*  Tha map of data you send from frontend should be of this format
    Player - {
      age : player age
      won : number
      imageUrl : player image
      matches played : number
      about : player description
      team name : team    // show a drop down of teams available
      team : team id     // will add team id
      id : player id    // i will add this while uploading to db
    }
   */

  Future<void> addPlayer(Map<String, dynamic> data) async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;

      final players =
          await FirebaseFirestore.instance.collection("Players").get();
      final len = players.docs.length;
      data["id"] = "Player $len";
      await FirebaseFirestore.instance
          .collection("Players")
          .doc('Player $len')
          .set(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<Stream<QuerySnapshot>?> getPlayers() async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return null;
      }
      isLoading.value = true;

      return await FirebaseFirestore.instance.collection("Players").snapshots();
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePlayer(String id, Map<String, dynamic> data) async {
    // if the image is modified then upload it using uploadToStorage function and then send its url in the data (map)
    // upload image with existing id only !
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;

      await FirebaseFirestore.instance
          .collection("Players")
          .doc(id)
          .update(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteTeam(String id) async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;

      await FirebaseFirestore.instance.collection("Players").doc(id).delete();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
