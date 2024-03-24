import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class BlogController {
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

  Future<String> uploadToStorage(
      Uint8List image, String collection, String id) async {
    var ref = FirebaseStorage.instance.ref().child(collection).child(id);
    final metadata = SettableMetadata(contentType: "image/jpeg");
    UploadTask uploadTask = ref.putData(image, metadata);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> postBlog(Map<String, dynamic> data) async {
    try {
      isLoading.value = true;
      if (!isAdmin) {
        Get.snackbar("Not Authorized", "You dont have access");
        return;
      }

      final blogs = await FirebaseFirestore.instance.collection("Blogs").get();
      final len = blogs.docs.length;
      data["id"] = "Blog $len";
      await FirebaseFirestore.instance
          .collection("Blogs")
          .doc('Blog $len')
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
}
