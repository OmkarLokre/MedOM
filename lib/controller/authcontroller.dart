import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/my_appointments/my_appointments.dart';
import 'package:online_doctor_booking/views/home_view/home.dart';
import 'package:online_doctor_booking/views/login_page.dart';

class AuthController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  UserCredential? userCredential;

  // Doctor Editing controllers:
  TextEditingController doctorAboutController = TextEditingController();
  TextEditingController doctorAddressController = TextEditingController();
  TextEditingController doctorPhoneController = TextEditingController();
  TextEditingController doctorServicesController = TextEditingController();
  TextEditingController doctorCategoryController = TextEditingController();
  TextEditingController doctorTimingController = TextEditingController();
  TextEditingController doctorNameController = TextEditingController();

  signUpUser() async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passController.text);

    if (userCredential != null) {
      await storeUserData(userCredential!.user!.uid, usernameController.text,
          emailController.text);
    }
  }

  storeUserData(String uid, String Username, String email) {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    // if (isDoctor) {
    //   await store.set({
    //     'docAbout': doctorAboutController.text,
    //     'docAddress': doctorAddressController.text,
    //     'docCategory': doctorCategoryController.text,
    //     'docPhone': doctorPhoneController.text,
    //     'docService': doctorServicesController.text,
    //     'docTime': doctorTimingController.text,
    //     'docName': Username,
    //     'docID': FirebaseAuth.instance.currentUser?.uid,
    //     'docRating': 1,
    //     'docEmail': email
    //   });
    // } else {
    store.set({
      'Username': Username,
      'Email': email,
    });
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  loginUser() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passController.text);
  }

  isUserAlreadyLoggedIn() async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        var data = await FirebaseFirestore.instance
            .collection('doctors')
            .doc(user.uid)
            .get();
        var isDoc = data.data()?.containsKey('docName') ?? false;
        if (isDoc) {
          Get.offAll(() => const Myappointments(
                isDoctor: true,
              ));
        }
        Get.offAll(() => Home());
      } else {
        Get.offAll(() => LoginPage());
      }
    });
  }
}
