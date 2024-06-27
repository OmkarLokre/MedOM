import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/controller/homecontroller.dart';
import 'package:online_doctor_booking/resources/components/custom_textField.dart';
import 'package:online_doctor_booking/resources/lists.dart';
import 'package:online_doctor_booking/views/category_details_view/category_details.dart';
import 'package:online_doctor_booking/views/category_view/search_view/search_view.dart';
import 'package:online_doctor_booking/views/chatbot_view.dart';
import 'package:online_doctor_booking/views/doctor_profile_view/doctor_view.dart';
import 'package:online_doctor_booking/views/lab_test_view/lab_test_view.dart';
import 'package:online_doctor_booking/views/maps_view/gmapsview.dart';
import 'package:online_doctor_booking/views/reports_view/uploadReports.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<String?> getUsername() async {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      return userDoc['Username'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#052759"),
        title: Center(
          child: Text(
            "Welcome to MEDOM",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder<String?>(
              future: getUsername(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: HexColor("#052759"),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: HexColor("#052759"),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Center(
                        // child: Text('Error: ${snapshot.error}',
                        //     style: TextStyle(color: Colors.white)),

                        ),
                  );
                } else {
                  return Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: HexColor("#052759"),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 20.0),
                    //           child: Container(
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(50),
                    //               color: Colors.white,
                    //             ),
                    //             height: 100,
                    //             width: 100,
                    //           ),
                    //         ),
                    //         20.widthBox,
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Padding(
                    //               padding: const EdgeInsets.only(top: 40.0),
                    //               child: Text(
                    //                   "Hello " +
                    //                       (snapshot.data ?? 'No Username'),
                    //                   style: TextStyle(
                    //                       color: Colors.white, fontSize: 35)),
                    //             ),
                    //             5.heightBox,
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //     10.heightBox,
                    //     Text("Your health, our Priority",
                    //         style: GoogleFonts.raleway(
                    //             textStyle: TextStyle(
                    //           fontSize: 35,
                    //           fontStyle: FontStyle.italic,
                    //         )))
                    //   ],
                    // ),
                    // child: Center(
                    //   child: Text(snapshot.data ?? 'No Username',
                    //       style: TextStyle(color: Colors.white, fontSize: 24)),
                    // ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/images/profileImg.png',
                                  fit: BoxFit.fill,
                                )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        20.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Row(
                                children: [
                                  Text(
                                      "Hello " +
                                          (snapshot.data ?? 'No Username'),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 35)),
                                  100.widthBox,
                                  Icon(
                                    Icons.notification_important_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            5.heightBox,
                            Text(
                              "Your health, our Priority",
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.yellow,
                                fontStyle: FontStyle.italic,
                              )),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
              },
            ),

            // Container(
            //   height: 160,
            //   decoration: BoxDecoration(
            //     color: HexColor("#052759"),
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(30),
            //         bottomRight: Radius.circular(30)),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hint: "Search Doctor..",
                    textEditingController: controller.searchQueryController,
                  )),
                  10.widthBox,
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor("#052759"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Get.to(() => SearchView(
                                searchQuery:
                                    controller.searchQueryController.text,
                              ));
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: HexColor("#052759"),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              categoryList[index].url,
                              width: 40,
                              height: 40,
                            ),
                            15.heightBox,
                            Text(
                              categoryList[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ).onTap(() {
                        Get.to(
                            CategoryDetails(catName: categoryList[index].name));
                      }),
                    );
                  },
                ),
              ),
            ),
            12.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Doctors",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            8.heightBox,
            FutureBuilder<QuerySnapshot>(
                future: controller.getDoctorList(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var data = snapshot.data?.docs;
                    return Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: SizedBox(
                        height: 180,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(Doctorpage(
                                  doc: data[index],
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: HexColor("#052759"),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      data![index]['image'],
                                      width: 100,
                                      height: 100,
                                    ),
                                    Divider(),
                                    Text(
                                      data![index]['docName'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    5.heightBox,
                                    Text(
                                      data![index]['docCategory'],
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
            8.heightBox,
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "View all",
                      style: TextStyle(color: HexColor("#052759")),
                    )),
              ),
            ),
            15.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // color: HexColor("#052759")
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                // color: HexColor("#052759")),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/images/labTest.webp',
                                    fit: BoxFit.fill,
                                  )),
                            ).onTap(() {
                              Get.to(LabTest());
                            }),
                            10.heightBox,
                            Text("Lab"),
                            Text("Tests")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // color: HexColor("#052759")
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                // color: HexColor("#052759")),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    width: 60,
                                    'assets/images/facts.png',
                                    fit: BoxFit.cover,
                                  )),
                            ).onTap(() {
                              Get.to(UploadReports());
                            }),
                            15.heightBox,
                            15.heightBox,
                            Text("Medical"),
                            Text("Facts")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              // color: HexColor("#052759")),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/images/reports.webp',
                                  fit: BoxFit.fill,
                                )),
                          ).onTap(() {
                            Get.to(UploadReports());
                          }),
                          5.heightBox,
                          Text("Uplaod"),
                          Text("Documents")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              // color: HexColor("#052759")),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/images/medical-health-15-512.webp',
                                  fit: BoxFit.fill,
                                )),
                          ).onTap(() {
                            Get.to(GmapsView());
                          }),
                          5.heightBox,
                          Text("Nearby"),
                          Text("Hospitals")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //  'assets/images/medical-health-15-512.webp',

            30.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        child: ClipRect(
                          child: Image.asset(
                            'assets/images/fg.webp',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      10.widthBox,
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: HexColor("#052759"),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(50))),
                          height: 70,
                          child: Center(
                            child: Text("AId Bot",
                                style: GoogleFonts.orbitron(
                                  textStyle: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 4),
                                )),
                          ),
                        ).onTap(() {
                          Get.to(ChatBot());
                        }),
                      ),
                    ],
                  ),
                  30.heightBox,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/controller/homecontroller.dart';
import 'package:online_doctor_booking/resources/lists.dart';
import 'package:online_doctor_booking/views/category_details_view/category_details.dart';
import 'package:online_doctor_booking/views/category_view/search_view/search_view.dart';
import 'package:online_doctor_booking/views/chatbot_view.dart';
import 'package:online_doctor_booking/views/doctor_profile_view/doctor_view.dart';
import 'package:online_doctor_booking/views/lab_test_view/lab_test_view.dart';
import 'package:online_doctor_booking/views/maps_view/gmapsview.dart';
import 'package:online_doctor_booking/views/reports_view/uploadReports.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<String?> getUsername() async {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      return userDoc['Username'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    final Size screenSize = MediaQuery.of(context).size; // Get the screen size

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Welcome to MEDOM",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<String?>(
              future: getUsername(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(),
                  );
                } else {
                  return Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/images/profileImg.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Hello " + (snapshot.data ?? 'No Username'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ),
                                  SizedBox(width: 100),
                                  Icon(
                                    Icons.notification_important_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Your health, our Priority",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.yellow,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search Doctor..",
                      ),
                      controller: controller.searchQueryController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.to(() => SearchView(
                            searchQuery:
                                controller.searchQueryController.text));
                      },
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                            CategoryDetails(catName: categoryList[index].name));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              categoryList[index].url,
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(height: 15),
                            Text(
                              categoryList[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Doctors",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            SizedBox(height: 8),
            FutureBuilder<QuerySnapshot>(
              future: controller.getDoctorList(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  var data = snapshot.data?.docs;
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: SizedBox(
                      height: 180,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(Doctorpage(doc: data![index]));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    data[index]['image'],
                                    width: 100,
                                    height: 100,
                                  ),
                                  Divider(),
                                  Text(
                                    data[index]['docName'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    data[index]['docCategory'],
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "View all",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/images/labTest.webp',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("Lab"),
                            Text("Tests"),
                          ],
                        ).onTap(() {
                          Get.to(LabTest());
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/images/facts.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text("Medical"),
                            Text("Facts"),
                          ],
                        ).onTap(() {
                          Get.to(UploadReports());
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/images/reports.webp',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Upload"),
                            Text("Documents"),
                          ],
                        ).onTap(() {
                          Get.to(UploadReports());
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'assets/images/medical-health-15-512.webp',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Nearby"),
                            Text("Hospitals"),
                          ],
                        ).onTap(() {
                          Get.to(GmapsView());
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        child: ClipRect(
                          child: Image.asset(
                            'assets/images/fg.webp',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          height: 70,
                          child: Center(
                            child: Text(
                              "AId Bot",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 4,
                              ),
                            ),
                          ),
                        ).onTap(() {
                          Get.to(ChatBot());
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: Homepage()));
}

*/
