import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/views/lab_test_view/book_lab_test.dart';

class LabDetails extends StatefulWidget {
  final String name;
  final String title1;
  final String desc1;
  final String title2;
  final String desc2;
  final String category;
  final int price;

  const LabDetails(
      {super.key,
      required this.name,
      required this.title1,
      required this.desc1,
      required this.title2,
      required this.desc2,
      required this.category,
      required this.price});

  @override
  State<LabDetails> createState() => _LabDetailsState();
}

class _LabDetailsState extends State<LabDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#052759"),
        title: Text(
          widget.name,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#052759"),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title1,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ),
                        20.heightBox,
                        Text(
                          widget.desc1,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ]),
                ),
              ),
              40.heightBox,
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#052759"),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title2,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ),
                        20.heightBox,
                        Text(
                          widget.desc2,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ]),
                ),
              )
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
                Get.to((BookALabTest(
                  category: widget.category,
                  price: widget.price,
                )));
              },
              child: Text(
                "View Details of the test",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
