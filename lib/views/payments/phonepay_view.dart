// import 'dart:convert';

// import 'package:crypto/crypto.dart';
// import 'package:flutter/material.dart';
// import 'package:online_doctor_booking/consts/consts.dart';
// import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

// class PhonepayView extends StatefulWidget {
//   const PhonepayView({super.key});

//   @override
//   State<PhonepayView> createState() => _PhonepayViewState();
// }

// class _PhonepayViewState extends State<PhonepayView> {
//   String environment = "UAT_SIM";
//   String appId = "";
//   String merchantId = "PGTESTPAYUAT";
//   bool enableLogging = true;
//   String checkSum = "";
//   String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
//   String saltIndex = "1";
//   String callBackUrl =
//       "https://webhook.site/fd3f1827-827c-4f2e-9e46-e617be508dcb";
//   String body = "";
//   Object? result;
//   String apiEndPoint = "/pg/v1/pay";

//   getCheckSum() {
//     final requestData = {
//       "merchantId": merchantId,
//       "merchantTransactionId": "MT7850590068188104",
//       "merchantUserId": "MUID123",
//       "amount": 10000,
//       "callbackUrl": callBackUrl,
//       "mobileNumber": "9999999999",
//       "paymentInstrument": {
//         "type": "PAY_PAGE",
//       }
//     };

//     String base64Body = base64.encode(utf8.encode(json.encode(requestData)));

//     checkSum =
//         '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey)).toString()}###$saltIndex';

//     return base64Body;
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     phonepeInit();
//     body = getCheckSum().toString();
//   }

//   void phonepeInit() {
//     PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
//         .then((val) => {
//               setState(() {
//                 result = 'PhonePe SDK Initialized - $val';
//               })
//             })
//         .catchError((error) {
//       handleError(error);
//       return <dynamic>{};
//     });
//   }

//   void handleError(error) {
//     setState(() {
//       result = {"error": error};
//     });
//   }

//   void startPGTransaction() async {
//     try {
//       var response = PhonePePaymentSdk.startTransaction(
//           body, callBackUrl, checkSum, apiEndPoint);
//       response
//           .then((val) => {
//                 setState(() {
//                   if (val != null) {
//                     String status = val['status'].toString();
//                     String error = val['error'].toString();

//                     if (status == 'SUCCESS') {
//                       result = "Flow compelete - status : SUCCESS";
//                     } else {
//                       result =
//                           "Flow compelete - status: $status and error: $error";
//                     }
//                   } else {
//                     result = "Flow incompelete";
//                   }
//                 })
//               })
//           .catchError((error) {
//         handleError(error);
//         return <dynamic>{};
//       });
//     } catch (error) {
//       handleError(error);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Phonepe Payment"),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 startPGTransaction();
//               },
//               child: Text("Start Transaction")),
//           40.heightBox,
//           Text("Result \n $result")
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PhonepayView extends StatefulWidget {
  const PhonepayView({super.key});

  @override
  State<PhonepayView> createState() => _PhonepayViewState();
}

class _PhonepayViewState extends State<PhonepayView> {
  String environment = "UAT_SIM";
  String appId = "";
  String merchantId = "PGTESTPAYUAT";
  bool enableLogging = true;
  String checkSum = "";
  String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
  String saltIndex = "1";
  String callBackUrl =
      "https://webhook.site/fd3f1827-827c-4f2e-9e46-e617be508dcb";
  String body = "";
  Object? result;
  String apiEndPoint = "/pg/v1/pay";

  getCheckSum() {
    final requestData = {
      "merchantId": merchantId,
      "merchantTransactionId": "MT7850590068188104",
      "merchantUserId": "MUID123",
      "amount": 10000,
      "callbackUrl": callBackUrl,
      "mobileNumber": "9999999999",
      "paymentInstrument": {
        "type": "PAY_PAGE",
      }
    };

    String base64Body = base64.encode(utf8.encode(json.encode(requestData)));

    checkSum =
        '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey)).toString()}###$saltIndex';

    return base64Body;
  }

  @override
  void initState() {
    super.initState();
    phonepeInit();
    body = getCheckSum().toString();
  }

  void phonepeInit() {
    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $val';
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  void handleError(error) {
    setState(() {
      result = {"error": error};
    });
  }

  void startPGTransaction() async {
    var response = PhonePePaymentSdk.startTransaction(
        body, callBackUrl, checkSum, apiEndPoint);
    response
        .then((response) => {
              setState(() {
                if (response != null) {
                  String status = response['status'].toString();
                  String error = response['error'].toString();
                  if (status == 'SUCCESS') {
                    "Flow Completed - Status: Success!";
                  } else {
                    "Flow Completed - Status: $status and Error: $error";
                  }
                } else {
                  "Flow Incomplete";
                }
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    }).catchError((error) {
      handleError(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phonepe Payment"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                startPGTransaction();
              },
              child: Text("Start Transaction")),
          SizedBox(height: 40), // Replaced 40.heightBox with SizedBox
          Text("Result \n $result")
        ],
      ),
    );
  }
}
