import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  Rx<bool> isLoading = false.obs;
  bool isAdmin = true; // will handle later

  // Blog Model
  /*  Tha map of data you send from frontend should be of this format
    Blog - {
      title : Blog title
      description : Blog description
      imageUrl : image url
      id : blog id    // i will add this while uploading to db
    }
    likes and comments will be handled by the app team
   */

  Future<void> postBlog(Map<String, dynamic> data) async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection("Blogs")
          .doc(data["id"])
          .set(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<Stream<QuerySnapshot>?> getBlogs() async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return null;
      }
      isLoading.value = true;

      return await FirebaseFirestore.instance.collection("Blogs").snapshots();
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateBlog(String id, Map<String, dynamic> data) async {
    // if the image is modified then upload it using uploadToStorage function and then send its url in the data (map)
    // upload image with existing id only !
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;

      await FirebaseFirestore.instance.collection("Blogs").doc(id).update(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteBlog(String id) async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }
      isLoading.value = true;

      await FirebaseFirestore.instance.collection("Blogs").doc(id).delete();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<Stream<QuerySnapshot>?> getRecentBlogs(int blogs) async {
    try {
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return null;
      }
      isLoading.value = true;

      return await FirebaseFirestore.instance
          .collection("Blogs")
          .orderBy(FieldPath.documentId, descending: true)
          .limit(5)
          .snapshots();
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
