import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:online_doctor_booking/consts/consts.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var searchQueryController = TextEditingController();
  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList() async {
    var doctors = FirebaseFirestore.instance.collection('doctors').get();
    return doctors;
  }
}
