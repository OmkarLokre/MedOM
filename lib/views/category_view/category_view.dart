import 'package:flutter/cupertino.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/resources/lists.dart';
import 'package:online_doctor_booking/views/category_details_view/category_details.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#052759"),
        title: Center(
            child: Text(
          "Categories",
          style: TextStyle(
            fontSize: 20,
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(CategoryDetails(catName: categoryList[index].name));
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: HexColor("#052759"),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        categoryList[index].url,
                        width: 60,
                      ),
                    ),
                    10.heightBox,
                    Divider(),
                    10.heightBox,
                    Text(
                      categoryList[index].name,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      "13 Specialists",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: categoryList.length,
        ),
      ),
    );
  }
}
