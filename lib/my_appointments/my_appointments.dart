import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/controller/appointmentcontroller.dart';
import 'package:online_doctor_booking/views/doctor_profile_view/appointment_details.dart';

class Myappointments extends StatelessWidget {
  final bool isDoctor;
  const Myappointments({super.key, required this.isDoctor});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
        appBar: AppBar(
          title: Text("My Appointments"),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: controller.getAppointments(isDoctor),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = snapshot.data?.docs;
                return ListView.builder(
                    itemCount: data?.length ?? 0,
                    itemBuilder: (BuildContext, index) {
                      return ListTile(
                        onTap: () {
                          Get.to(AppointmentDetails(
                            doc: data![index],
                          ));
                        },
                        leading: CircleAvatar(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'image/assets/profileImg.png',
                                fit: BoxFit.fill,
                              )),
                        ),
                        title: Text(
                          data![index]
                              [isDoctor ? 'appointmentDoc' : 'patientName'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            // Text(data?[index]['appointmentDay'] +
                            //         " - " +
                            //         data?[index]['appointmentTime'])
                            //     .opacity(value: 0.7),
                            Text(data[index]['appointmentDay'] +
                                '-->' +
                                data[index]['appointmentTime']),
                      );
                    });
              }
            }));
  }
}
