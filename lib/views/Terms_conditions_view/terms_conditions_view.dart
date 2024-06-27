import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#052759"),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.heightBox,
                Text(
                  "Terms and Conditions",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
                5.heightBox,
                Text(
                  "Last updated: 15/05/2024",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                5.heightBox,
                Divider(),
                Text(
                  "1. Acceptance of Terms",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 25),
                ),
                10.heightBox,
                Text(
                  "Welcome to MEDOM! These terms and conditions outline the rules and regulations for the use of our mobile application, developed using Flutter and Firebase, designed to enhance healthcare accessibility and efficiency.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
                30.heightBox,
                Text(
                  "2. Use of the App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 25),
                ),
                10.heightBox,
                Text(
                  "You must be at least 18 years old to use this App. By using the App, you represent and warrant that you meet this eligibility requirement"
                  "To access certain features of the App, you may need to register for an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
                Text(
                  "3. Medical Information Disclaimer",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 25),
                ),
                10.heightBox,
                Text(
                  "The App provides general medical information and online doctor booking services. The medical information provided in the App is for informational purposes only and should not be construed as medical advice or a substitute for professional healthcare advice. Always seek the advice of your physician or other qualified healthcare provider with any questions you may have regarding a medical condition.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
                Text(
                  "4. AI-Powered Chatbot",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 25),
                ),
                10.heightBox,
                Text(
                  "Our AI-powered chatbot, integrated with the Google Gemini API, is designed to provide users with information about medications, symptoms, and first aid. The information provided by the chatbot is for informational purposes only and should not be considered as medical advice. Users should always consult a healthcare professional for medical advice and treatment.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
                Text(
                  "5. Data Privacy and Security",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 25),
                ),
                10.heightBox,
                Text(
                  "Your privacy is important to us. We collect, use, and protect personal data in accordance with our Privacy Policy. By using the App, you consent to such collection and use of your data.We use Firebase Firestore for robust data management and Firebase Authentication for secure user access. While we implement reasonable security measures to protect your data, we cannot guarantee the absolute security of your information.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
                Text(
                  "6. Limitation of Liability",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 25),
                ),
                10.heightBox,
                Text(
                  "To the maximum extent permitted by applicable law, MEDOM and its affiliates, officers, directors, employees, and agents shall not be liable for any indirect, incidental, special, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from:"
                  "Your use or inability to use the App."
                  "Any unauthorized access to or use of our servers and/or any personal information stored therein"
                  "Any interruption or cessation of transmission to or from the App.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
                30.heightBox,
                Text(
                  "7. Governing Law",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 25),
                ),
                10.heightBox,
                Text(
                  "These Terms and Conditions are governed by and construed in accordance with the laws of [Your Country/State]. Any disputes arising under or in connection with these terms shall be subject to the exclusive jurisdiction of the courts of [Your Country/State].",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
                30.heightBox,
                Text(
                  "10. Contact Us",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 25),
                ),
                10.heightBox,
                Text(
                  "If you have any questions or concerns about these Terms and Conditions, please contact us at medom123@gmail.com.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
