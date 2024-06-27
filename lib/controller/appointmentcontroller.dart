import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:online_doctor_booking/consts/consts.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;

  var appointDayController = TextEditingController();
  var appointTimeController = TextEditingController();
  var patientController = TextEditingController();
  var patientNumberController = TextEditingController();
  var MessageController = TextEditingController();

  bookAppointMent(
    String docId,
    String date,
    String time,
    context,
  ) async {
    isLoading(true);

    var store = FirebaseFirestore.instance.collection('appointment').doc();
    await store.set({
      'appointmentBy': FirebaseAuth.instance.currentUser?.uid,
      'appointmentDay': date,
      'appointmentTime': time,
      'patientName': patientController.text,
      'patientNumber': patientNumberController.text,
      'message': MessageController.text,
      'appointmentDoc': docId,
      // 'date': date,
      // 'time': time,
    });
    isLoading(false);
    VxToast.show(context, msg: "Appointment Booked successfully!");
    Get.back();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments(bool isDoctor) {
    if (isDoctor) {
      return FirebaseFirestore.instance
          .collection("appointment")
          .where('appointmentDoc',
              isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    } else {
      return FirebaseFirestore.instance
          .collection("appointment")
          .where('appointmentBy',
              isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    }
  }
}
