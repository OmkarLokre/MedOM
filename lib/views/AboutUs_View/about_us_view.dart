import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_doctor_booking/consts/consts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#263248"),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                70.heightBox,
                Center(
                  child: Text(
                    "MEDOM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        fontSize: 40),
                  ),
                ),
                5.heightBox,
                Center(
                  child: Text(
                    "Your health our priority",
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                5.heightBox,
                Divider(),
                20.heightBox,
                Center(
                  child: Text(
                    "Welcome to MEDOM, where healthcare accessibility meets innovation. We are dedicated to transforming the way you access healthcare, bringing convenience and efficiency to your fingertips. Our mission is to bridge the gap between patients and healthcare providers through a user-friendly platform that empowers individuals to take charge of their health with ease and confidence.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
                15.heightBox,
                Text(
                  "MEDOM is the brainchild of a team of passionate healthcare and technology professionals who envisioned a world where medical services are just a tap away. We recognized the challenges many face in booking doctor appointments, accessing reliable medical information, and managing health records. With this in mind, we set out to create an integrated solution that addresses these pain points, making healthcare more accessible and manageable for everyone.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                15.heightBox,
                Text(
                  "In addition to appointment scheduling, MEDOM offers a wealth of categorized medical information. Our goal is to provide users with reliable and up-to-date health information, empowering you to make informed decisions about your well-being. Whether you're looking for information on symptoms, treatments, or preventative care, our app serves as a valuable resource for all your health-related inquiries.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                15.heightBox,
                Text(
                  "Security and privacy are paramount at MEDOM. We understand the sensitivity of medical records and personal health information. That's why our app includes features for securely uploading and accessing medical reports. By leveraging Firebase Firestore for robust data management and Firebase Authentication for secure user access, we ensure that your information is protected with the highest standards of data security.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                15.heightBox,
                Text(
                  "To further enhance your experience, we have integrated an AI-powered chatbot, supported by the Google Gemini API. This intelligent assistant is designed to assist you with inquiries about medications, symptoms, and first aid, providing instant and reliable information at any time. While the chatbot offers valuable insights, we always recommend consulting with healthcare professionals for personalized medical advice and treatment.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                15.heightBox,
                Text(
                  "At MEDOM, we are committed to continuous improvement and innovation. Our team is constantly working to enhance the app's features and functionality, ensuring that we meet the evolving needs of our users. We believe that healthcare should be accessible, convenient, and tailored to individual needs, and we are dedicated to making this vision a reality"
                  "Thank you for choosing MEDOM as your trusted partner in health. We are excited to be part of your healthcare journey and look forward to serving you with excellence and care. If you have any questions, feedback, or suggestions, please do not hesitate to contact us. Together, let's make healthcare better and more accessible for everyone.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
