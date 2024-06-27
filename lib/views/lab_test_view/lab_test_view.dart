// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:online_doctor_booking/consts/consts.dart';
// import 'package:online_doctor_booking/resources/components/custom_textField.dart';
// import 'package:online_doctor_booking/resources/lists.dart';

// class LabTest extends StatefulWidget {
//   const LabTest({super.key});

//   @override
//   State<LabTest> createState() => _LabTestState();
// }

// class _LabTestState extends State<LabTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 200,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             color: HexColor("#052759"),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(40),
//               bottomRight: Radius.circular(40),
//             )),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               40.heightBox,
//               Row(
//                 children: [
//                   20.widthBox,
//                   Text(
//                     "Test Categories",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               30.heightBox,
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Search category....",
//                           hintStyle: TextStyle(color: Colors.white),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                               width: 2.0,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                               width: 2.0,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             borderSide: BorderSide(
//                               color: Colors.blue,
//                               width: 2.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     10.widthBox,
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: IconButton(
//                           onPressed: () {
//                             // Get.to(() => SearchView(
//                             //       searchQuery:
//                             //           controller.searchQueryController.text,
//                             //     ));
//                           },
//                           icon: Icon(
//                             Icons.search,
//                             color: HexColor("#052759"),
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//               40.heightBox,

//               GridView.builder(
//                 physics: BouncingScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisExtent: 250,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       // Get.to(CategoryDetails(catName: categoryList[index].name));
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           color: HexColor("#052759"),
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Center(
//                             child: Image.asset(
//                               categoryList[index].url,
//                               width: 60,
//                             ),
//                           ),
//                           10.heightBox,
//                           Divider(),
//                           10.heightBox,
//                           Text(
//                             categoryList[index].name,
//                             style: TextStyle(color: Colors.white, fontSize: 24),
//                           ),
//                           Text(
//                             "13 Specialists",
//                             style: TextStyle(
//                                 color: Colors.white.withOpacity(0.7),
//                                 fontSize: 18),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: categoryList.length,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/resources/components/custom_textField.dart';
import 'package:online_doctor_booking/resources/lists.dart';
import 'package:online_doctor_booking/views/lab_test_view/lab_details.dart';

class LabTest extends StatefulWidget {
  const LabTest({super.key});

  @override
  State<LabTest> createState() => _LabTestState();
}

class _LabTestState extends State<LabTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: HexColor("#052759"),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        "Test Categories",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search category....",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                              onPressed: () {
                                // Get.to(() => SearchView(
                                //       searchQuery:
                                //           controller.searchQueryController.text,
                                //     ));
                              },
                              icon: Icon(
                                Icons.search,
                                color: HexColor("#052759"),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  30.heightBox,
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 200,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(LabDetails(
                        name: LabList[index].name,
                        title1: LabList[index].title1,
                        desc1: LabList[index].desc1,
                        title2: LabList[index].title2,
                        desc2: LabList[index].desc2,
                        category: LabList[index].category,
                        price: LabList[index].price,
                      ));
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: HexColor("#052759"),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              LabList[index].url,
                              width: 60,
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          Text(
                            LabList[index].name,
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "13 Specialists",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: LabList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
