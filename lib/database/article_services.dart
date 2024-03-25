import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kabadi_admin/database/common_services.dart';

class ArticleController extends GetxController {
  bool isAdmin = true;
  Rx<bool> isLoading = false.obs;
  Rx<String> selectedValue = "Kabaddi Matches".obs;

  // Article Model
  /*  Tha map of data you send from frontend should be of this format
    Article - {
      title : Article title
      description : Article description
      imageUrl : image url
      topic : [Kabaddi Matches,Kabaddi Team,Kabaddi Players]   // handle this validation
      id : article id    // i will add this while uploading to db
    }
    likes and comments will be handled by the app team
   */

  Future<void> postArticle(Map<String, dynamic> data) async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection("Articles")
          .doc(data["id"])
          .set(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<Stream<QuerySnapshot>?> getAllArticles() async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return null;
      }
      isLoading.value = true;
      return await FirebaseFirestore.instance
          .collection("Articles")
          .snapshots();
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<Stream<QuerySnapshot>?> getArticlesByTopic(String topic) async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return null;
      }
      isLoading.value = true;
      return await FirebaseFirestore.instance
          .collection("Articles")
          .where("topic", isEqualTo: topic)
          .snapshots();
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateArticle(String id, Map<String, dynamic> data) async {
    // if the image is modified then upload it using uploadToStorage function and then send its url in the data (map)
    // upload image with existing id only !
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;

      await FirebaseFirestore.instance
          .collection("Articles")
          .doc(id)
          .update(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteArticle(String id) async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;

      await FirebaseFirestore.instance.collection("Articles").doc(id).delete();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
