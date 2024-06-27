// import 'package:flutter/cupertino.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:online_doctor_booking/consts/consts.dart';
// import 'package:online_doctor_booking/my_appointments/my_appointments.dart';
// import 'package:online_doctor_booking/views/category_view/category_view.dart';
// import 'package:online_doctor_booking/views/home_view/homepage.dart';
// import 'package:online_doctor_booking/views/login_page.dart';
// import 'package:online_doctor_booking/views/setting_view/settingspage.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int selectedIndex = 0;
//   List screenList = [
//     const Homepage(),
//     const Myappointments(),
//     CategoriesView(),
//     SettingsPage()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: HexColor("#052759"),
//         type: BottomNavigationBarType.fixed,
//         unselectedIconTheme: IconThemeData(
//           color: Colors.white.withOpacity(0.5),
//         ),
//         selectedIconTheme: IconThemeData(
//           color: Colors.white.withOpacity(1),
//         ),
//         selectedLabelStyle: TextStyle(color: Colors.yellow),
//         currentIndex: selectedIndex,
//         onTap: (value) {
//           setState(() {
//             selectedIndex = value;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.book_online_outlined), label: "Appointments"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.category), label: "Category"),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings")
//         ],
//       ),
//       body: screenList.elementAt(selectedIndex),
//     );
//   }
// }

// CHATGPT RESP

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/my_appointments/my_appointments.dart';
import 'package:online_doctor_booking/views/category_view/category_view.dart';
import 'package:online_doctor_booking/views/home_view/homepage.dart';
import 'package:online_doctor_booking/views/setting_view/settingspage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    const Homepage(),
    const Myappointments(
      isDoctor: false,
    ),
    const CategoriesView(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HexColor("#052759"),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedLabelStyle: const TextStyle(color: Colors.yellow),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online_outlined), label: "Appointments"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
      body: screenList.elementAt(selectedIndex),
    );
  }
}
