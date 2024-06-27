import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SettinsController extends GetxController {
  var isLoading = false.obs;
  var currentUser = FirebaseAuth.instance.currentUser;
  var username = ''.obs;
  var email = ''.obs;

  getUserData() async {
    isLoading(true);
    DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
        .instance
        .collection('user')
        .doc(currentUser!.uid)
        .get();

    var userData = user.data();
    username.value = userData!['Username'] ?? "";
    email.value = userData['Email'] ?? "";
    isLoading(false);
  }
}
