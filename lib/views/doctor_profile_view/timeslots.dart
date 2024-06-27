import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/controller/booked_appointment_controller.dart';
import 'package:online_doctor_booking/views/doctor_profile_view/appointment_view.dart';

class TimeSlots extends StatefulWidget {
  final DocumentSnapshot doc;
  const TimeSlots({super.key, required this.doc});

  @override
  State<TimeSlots> createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlots> {
  // var controller = Get.put(BookedAppointmentController());

  late List<DateTime> timeSlots;
  late List<String> formattedTimeSlots;
  late List<String> formattedDateSlots;
  static int a = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var timestamps = widget.doc['timestamp'] as List<dynamic>;
    timeSlots = timestamps
        .map((timestamp) => (timestamp as Timestamp).toDate())
        .toList();
    formattedTimeSlots = timeSlots
        .map((timeSlot) => DateFormat('hh:mm a').format(timeSlot))
        .toList();
    formattedDateSlots = timeSlots
        .map((timeSlot) => DateFormat('yy-MM-dd').format(timeSlot))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<bool> isBooked = [];
    // for (int i = 0; i < formattedDateSlots.length; i++) {
    //   isBooked[i] = true;
    // }
    return Scaffold(
      // body: ListView.builder(
      //     itemCount: formattedDateSlots.length,
      //     itemBuilder: (context, index) {
      //       return Column(
      //         children: [
      //           // InkWell(
      //           //     onTap: () {
      //           //       a = index;
      //           //     },
      //           //     child: Container(
      //           //       child: Text(formattedDateSlots[index]),
      //           //     )),
      //           // Container(
      //           //   child: Text(formattedTimeSlots[index]),
      //           // ),
      //           InkWell(
      //             onTap: () {
      //               a = index;
      //             },
      //             child: Padding(
      //               padding: const EdgeInsets.all(15.0),
      //               child: Card(
      //                 shape: RoundedRectangleBorder(),
      //                 child: Container(

      //                   child: Column(
      //                     children: [
      //                       Text(formattedDateSlots[index]),
      //                       Divider(),
      //                       Container(
      //                         child: Text(formattedTimeSlots[index]),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           20.heightBox,
      //         ],
      //       );
      //     }),

      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          child: GridView.builder(
              itemCount: formattedDateSlots.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 160),
              itemBuilder: (builder, index) {
                return Column(
                  children: [
                    // InkWell(
                    //     onTap: () {
                    //       a = index;
                    //     },
                    //     child: Container(
                    //       child: Text(formattedDateSlots[index]),
                    //     )),
                    // Container(
                    //   child: Text(formattedTimeSlots[index]),
                    // ),
                    InkWell(
                      onTap: () {
                        a = index;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    formattedDateSlots[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: HexColor('#052759'),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        formattedTimeSlots[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    20.heightBox,
                  ],
                );
              }),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: SizedBox(
          width: context.screenWidth - 60,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: StadiumBorder(),
                backgroundColor: HexColor("#052759"),
                shadowColor: Colors.black,
              ),
              onPressed: () {
                String date = formattedDateSlots[a];
                String time = formattedTimeSlots[a];

                // controller.setDayAndTime(date, time);
                Get.to(Appointment(
                  docId: widget.doc['docID'],
                  docName: widget.doc['docName'],
                  date: date,
                  time: time,
                ));
                // Get.to(TimeSlots(doc: doc));
              },
              child: Text(
                "Fill up details",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}


// String date = formattedDateSlots[a];
//                 String time = formattedTimeSlots[a];

//                 // controller.setDayAndTime(date, time);
//                 Get.to(Appointment(
//                     docId: widget.doc['docID'],
//                     docName: widget.doc['docName'],date: date,
//                     time: time,
//                     ));
