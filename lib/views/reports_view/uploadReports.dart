// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:online_doctor_booking/consts/consts.dart';

// class UploadReports extends StatefulWidget {
//   const UploadReports({super.key});

//   @override
//   State<UploadReports> createState() => _UploadReportsState();
// }

// class _UploadReportsState extends State<UploadReports> {
//   List<Map<String, dynamic>> pdfDataList = [];

//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   Future<String> UploadPDFs(String fileName, File file) async {
//     final reference =
//         FirebaseStorage.instance.ref().child("reports/$fileName.pdf");
//     final upladTask = reference.putFile(file);
//     await upladTask.whenComplete(() {});
//     final downloadLink = await reference.getDownloadURL();
//     return downloadLink;
//   }

//   void pickFile() async {
//     final pickedFile = await FilePicker.platform
//         .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

//     if (pickedFile != null) {
//       String filename = pickedFile.files[0].name;
//       File file = File(pickedFile.files[0].path!);
//       final downloadLink = await UploadPDFs(filename, file);
//       await _firebaseFirestore
//           .collection("Reports")
//           .add({"name": filename, "link": downloadLink});

//       print("Pdf Uploaded successfully!");
//     }
//   }

//   void getAllPdfs() async {
//     final pdfData = await _firebaseFirestore.collection("Reports").get();
//     pdfDataList = pdfData.docs.map((e) => e.data()).toList();

//     setState(() {});
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getAllPdfs();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#052759"),
//         title: Text(
//           "Upload Your Reports",
//           style: TextStyle(
//               fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: GridView.builder(
//           scrollDirection: Axis.vertical,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2),
//           itemCount: pdfDataList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 margin: EdgeInsets.only(right: 15),
//                 // height: 60,
//                 // width: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: HexColor("#052759"),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Image.asset(
//                       'assets/images/10154472.png',
//                       width: 100,
//                       height: 120,
//                     ),
//                     Divider(),
//                     Text(
//                       pdfDataList[index]['name'],
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ).onTap(() {
//                 Get.to(PsfViewScreen(PDFurl: pdfDataList[index]['link']));
//               }),
//             );
//           }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           pickFile();
//         },
//         child: Icon(Icons.upload_file_outlined),
//       ),
//     );
//   }
// }

// class PsfViewScreen extends StatefulWidget {
//   final String PDFurl;
//   const PsfViewScreen({super.key, required this.PDFurl});
//   @override
//   State<PsfViewScreen> createState() => _PsfViewScreenState();
// }

// class _PsfViewScreenState extends State<PsfViewScreen> {
//   PDFDocument? document;

//   void initialsiePDF() async {
//     document = await PDFDocument.fromURL(widget.PDFurl);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initialsiePDF();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: document != null
//           ? PDFViewer(
//               document: document!,
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';

class UploadReports extends StatefulWidget {
  const UploadReports({super.key});

  @override
  State<UploadReports> createState() => _UploadReportsState();
}

class _UploadReportsState extends State<UploadReports> {
  List<Map<String, dynamic>> pdfDataList = [];

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> uploadPDFs(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child("reports/$fileName.pdf");
    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = await reference.getDownloadURL();
    return downloadLink;
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (pickedFile != null) {
      String filename = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      final downloadLink = await uploadPDFs(filename, file);
      await _firebaseFirestore
          .collection("Reports")
          .add({"name": filename, "link": downloadLink});

      print("Pdf Uploaded successfully!");
      getAllPdfs(); // Refresh the list after uploading
    }
  }

  void getAllPdfs() async {
    final pdfData = await _firebaseFirestore.collection("Reports").get();
    pdfDataList = pdfData.docs.map((e) => e.data()).toList();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllPdfs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#052759"),
        title: Text(
          "Upload Your Reports",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: pdfDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor("#052759"),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/10154472.png',
                    width: 100,
                    height: 120,
                  ),
                  Divider(),
                  Text(
                    pdfDataList[index]['name'],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ).onTap(() {
              Get.to(PdfViewScreen(PDFurl: pdfDataList[index]['link']));
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickFile();
        },
        child: Icon(Icons.upload_file_outlined),
      ),
    );
  }
}

class PdfViewScreen extends StatefulWidget {
  final String PDFurl;
  const PdfViewScreen({super.key, required this.PDFurl});

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  PDFDocument? document;
  bool isLoading = true;

  void initialisePDF() async {
    try {
      document = await PDFDocument.fromURL(widget.PDFurl);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Error loading PDF: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initialisePDF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        backgroundColor: HexColor("#052759"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : document != null
              ? PDFViewer(document: document!)
              : Center(
                  child: Text("Failed to load PDF"),
                ),
    );
  }
}
