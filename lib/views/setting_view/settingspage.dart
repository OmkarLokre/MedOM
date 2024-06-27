import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/controller/authcontroller.dart';
import 'package:online_doctor_booking/resources/lists.dart';
import 'package:online_doctor_booking/views/AboutUs_View/about_us_view.dart';
import 'package:online_doctor_booking/views/Terms_conditions_view/terms_conditions_view.dart';
import 'package:online_doctor_booking/views/login_page.dart';
import 'package:online_doctor_booking/views/setting_view/settingsController.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettinsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#052759"),
        elevation: 10,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        child: Image.asset('assets/images/heart.png')),
                    title: Text(controller.username.value),
                    subtitle: Text(controller.email.value),
                  ),
                  const Divider(),
                  20.heightBox,
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                        settings_list.length,
                        (index) => ListTile(
                              onTap: () async {
                                if (index == 1) {
                                  Get.to(TermsConditions());
                                } else if (index == 2) {
                                  Get.to(AboutUs());
                                } else if (index == 3) {
                                  AuthController().signout();
                                  Get.offAll(() => LoginPage());
                                }
                              },
                              leading: settings_icon_list[index],
                              title: Text(settings_list[index]),
                            )),
                  ),
                ],
              ),
      ),
    );
  }
}
