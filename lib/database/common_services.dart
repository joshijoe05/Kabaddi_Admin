import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:kabadi_admin/responsive/home.dart';
import 'package:kabadi_admin/screens/admin_sidebar.dart';

class CommonServices extends GetxController {
  late Rx<User?> _user;
  static late String userRole;

  User? get user => _user.value;

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => Home());
    } else {
      var users = await FirebaseFirestore.instance
          .collection("Users")
          .where("uid", isEqualTo: user.uid)
          .get();
      userRole = users.docs.first.data()["role"];
      if (userRole == "admin" || userRole == "referee") {
        Get.offAll(() => AdminSideBar());
      } else {
        Get.offAll(() => Home());
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  Future<String> uploadToStorage(
      Uint8List image, String collection, String id) async {
    var ref = FirebaseStorage.instance.ref().child(collection).child(id);
    final metadata = SettableMetadata(contentType: "image/jpeg");
    UploadTask uploadTask = ref.putData(image, metadata);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // user roles will be handled here
}
