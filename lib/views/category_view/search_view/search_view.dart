import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/views/doctor_profile_view/doctor_view.dart';

// class SearchView extends StatelessWidget {
//   final String searchQuery;
//   const SearchView({super.key, required this.searchQuery});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#052759"),
//         title: Center(
//           child: Text(
//             "Search Results",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body: FutureBuilder<QuerySnapshot>(
//         future: FirebaseFirestore.instance.collection("doctors").get(),
//         // future: FirebaseFirestore.instance
//         //     .collection("doctors")
//         //     .where('docCategory', isEqualTo: catName)
//         //     .get(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 child: GridView.builder(
//                     scrollDirection: Axis.vertical,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisExtent: 170,
//                             crossAxisSpacing: 8,
//                             mainAxisSpacing: 8),
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       var doc = snapshot.data!.docs[index];
//                       return !(doc['docName'].toString().toLowerCase())
//                               .contains(searchQuery)
//                           ? Center(
//                               child: Container(
//                                 child: Center(
//                                   child: Text("No such results found!"),
//                                 ),
//                               ),
//                             )
//                           : Container(
//                               margin: EdgeInsets.only(right: 15),
//                               height: 100,
//                               width: 150,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: HexColor("#052759"),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     'assets/images/heart.png',
//                                     width: 40,
//                                     height: 60,
//                                   ),
//                                   Divider(),
//                                   Text(
//                                     doc['docName'],
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   5.heightBox,
//                                   VxRating(
//                                     onRatingUpdate: (value) {},
//                                     count: 5,
//                                     isSelectable: true,
//                                     maxRating: 5,
//                                     value: double.parse(
//                                         doc['docRating'].toString()),
//                                     stepInt: true,
//                                   )
//                                 ],
//                               ),
//                             ).onTap(() {
//                               Get.to(Doctorpage(
//                                 doc: doc,
//                               ));
//                             });
//                     }),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#052759"),
        title: Center(
          child: Text(
            "Search Results",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("doctors").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var docs = snapshot.data!.docs;
            var filteredDocs = docs.where((doc) {
              return (doc['docName'].toString().toLowerCase())
                  .contains(searchQuery.toLowerCase());
            }).toList();

            if (filteredDocs.isEmpty) {
              return Center(
                child: Text("No such results found!"),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 170,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: filteredDocs.length,
                itemBuilder: (BuildContext context, int index) {
                  var doc = filteredDocs[index];
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
                          'assets/images/heart.png',
                          width: 40,
                          height: 60,
                        ),
                        Divider(),
                        Text(
                          doc['docName'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        VxRating(
                          onRatingUpdate: (value) {},
                          count: 5,
                          isSelectable: true,
                          maxRating: 5,
                          value: double.parse(doc['docRating'].toString()),
                          stepInt: true,
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Get.to(Doctorpage(doc: doc));
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }
}
