import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/resources/lists.dart';
import 'package:online_doctor_booking/views/doctor_profile_view/doctor_view.dart';

class CategoryDetails extends StatelessWidget {
  final String catName;
  const CategoryDetails({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#052759"),
          title: Text(
            catName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection("doctors")
                .where('docCategory', isEqualTo: catName)
                .get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = snapshot.data?.docs;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 170,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemCount: data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
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
                                  data[index]['docName'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                5.heightBox,
                                VxRating(
                                  onRatingUpdate: (value) {},
                                  count: 5,
                                  isSelectable: true,
                                  maxRating: 5,
                                  value: double.parse(
                                      data[index]['docRating'].toString()),
                                  stepInt: true,
                                )
                              ],
                            ),
                          ).onTap(() {
                            Get.to(() => Doctorpage(doc: data[index]));
                          });
                        }),
                  ),
                );
              }
            }));
  }
}
