import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/controller/appointmentcontroller.dart';
import 'package:online_doctor_booking/resources/components/custom_textField.dart';

class AppointmentDetails extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetails({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Appointment Day:"),
              5.heightBox,
              Text(
                doc['appointmentDay'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              20.heightBox,
              Text("Appointment time:"),
              5.heightBox,
              Text(doc['appointmentTime']),
              20.heightBox,
              Text("Name of patient:"),
              5.heightBox,
              Text(
                doc['patientName'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              20.heightBox,
              Text("Mobile number of patient:"),
              5.heightBox,
              Text(
                doc['patientNumber'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
