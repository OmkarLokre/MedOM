import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/resources/components/custom_button.dart';
import 'package:online_doctor_booking/views/doctor_profile_view/appointment_view.dart';
import 'package:online_doctor_booking/views/doctor_profile_view/timeslots.dart';

class Doctorpage extends StatelessWidget {
  final DocumentSnapshot doc;
  const Doctorpage({super.key, required this.doc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#052759"),
        title: Text("Doctor Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                height: 100,
                decoration: BoxDecoration(
                  color: HexColor("052759"),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                doc['image'],
                                fit: BoxFit.fill,
                              )),
                        ),
                        20.widthBox,
                        Column(
                          children: [
                            Text(
                              "Name: " + doc['docName'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              doc['docCategory'],
                              style: TextStyle(color: Colors.white),
                            ),
                            VxRating(
                              onRatingUpdate: (value) {},
                              count: 5,
                              isSelectable: true,
                              maxRating: 5,
                              value: double.parse(doc['docRating'].toString()),
                              stepInt: true,
                            )
                          ],
                        ),
                        10.widthBox,
                        Text(
                          "See all Reviews.",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                      color: HexColor("052759"),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "Phone number",
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text("91-" + doc['docPhone'],
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7))),
                          trailing: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        15.heightBox,
                        Text(
                          "About",
                          style: TextStyle(color: Colors.amber, fontSize: 14),
                        ),
                        5.heightBox,
                        Text(
                          doc['docAbout'],
                          style: TextStyle(color: Colors.white),
                        ),
                        10.heightBox,
                        Text(
                          doc['docAddress'],
                          style: TextStyle(color: Colors.amber),
                        ),
                        5.heightBox,
                        Text(
                          "This is the address section of the doctor!",
                          style: TextStyle(color: Colors.white),
                        ),
                        10.heightBox,
                        Text(
                          "Working Time",
                          style: TextStyle(color: Colors.amber),
                        ),
                        5.heightBox,
                        Text(
                          "9.00 am to 4.00 pm",
                          style: TextStyle(color: Colors.white),
                        ),
                        10.heightBox,
                        Text(
                          "Services",
                          style: TextStyle(color: Colors.amber),
                        ),
                        5.heightBox,
                        Text(
                          doc['docService'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                // Get.to(Appointment(
                //   docId: doc['docID'],
                //   docName: doc['docName'],
                // ));
                Get.to(TimeSlots(doc: doc));
              },
              child: Text(
                "Select Time Slots",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
