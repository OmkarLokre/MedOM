import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/controller/appointmentcontroller.dart';
import 'package:online_doctor_booking/resources/components/custom_textField.dart';

class Appointment extends StatelessWidget {
  final String docId;
  final String docName;
  final String date;
  final String time;
  const Appointment(
      {super.key,
      required this.docId,
      required this.docName,
      required this.date,
      required this.time});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor: " + docName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select appointment date:"),
              5.heightBox,
              // CustomTextField(
              //   hint: "Select Date",
              //   textEditingController: controller.appointDayController,
              // ),
              20.heightBox,
              Text("Enter the name of patient:"),
              5.heightBox,
              CustomTextField(
                  hint: "Enter name",
                  textEditingController: controller.patientController),
              20.heightBox,
              Text("Enter mobile number of patient:"),
              5.heightBox,
              CustomTextField(
                  hint: "Mobile number",
                  textEditingController: controller.patientNumberController),
              20.heightBox,
              Text("Enter a message if any"),
              5.heightBox,
              CustomTextField(
                  hint: "Write here",
                  textEditingController: controller.MessageController),
              20.heightBox,
              Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: StadiumBorder(),
                          backgroundColor: HexColor("#052759"),
                          shadowColor: Colors.black,
                        ),
                        onPressed: () async {
                          await controller.bookAppointMent(
                              docId, date, time, context);
                          Get.back();
                        },
                        child: Text(
                          "Book Now!",
                          style: TextStyle(color: Colors.white),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
