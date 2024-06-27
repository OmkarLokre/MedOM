import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/views/payments/phonepay_view.dart';

class BookALabTest extends StatefulWidget {
  final String category;
  final int price;
  const BookALabTest({super.key, required this.category, required this.price});

  @override
  State<BookALabTest> createState() => _BookALabTestState();
}

class _BookALabTestState extends State<BookALabTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#052759"),
        title: Text(
          "Your test details",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            40.heightBox,
            Container(
              width: 600,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: HexColor("#052759"),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Your Test Order Details",
                      style: TextStyle(
                        color: Colors.amber[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    50.heightBox,
                    Row(
                      children: [
                        Text(
                          "Your Lab Test Category: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        Text(widget.category,
                            style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            )),
                      ],
                    ),
                    5.heightBox,
                    Divider(),
                    50.heightBox,
                    Row(
                      children: [
                        Text("Your Lab Test price: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            )),
                        Text(widget.price.toString(),
                            style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            )),
                      ],
                    ),
                    5.heightBox,
                    Divider(),
                    50.heightBox,
                  ],
                ),
              ),
            )
          ],
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
                Get.to((PhonepayView()));
              },
              child: Text(
                "Pay and Book your test",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
