import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/controller/authcontroller.dart';
import 'package:online_doctor_booking/my_appointments/my_appointments.dart';
import 'package:online_doctor_booking/resources/components/custom_button.dart';
import 'package:online_doctor_booking/resources/components/custom_textField.dart';
import 'package:online_doctor_booking/views/doctor_profile_view/appointment_view.dart';
import 'package:online_doctor_booking/views/home_view/home.dart';
import 'package:online_doctor_booking/views/home_view/homepage.dart';
import 'package:online_doctor_booking/views/signup_view/signup.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset('assets/images/image.png'),
                      ),
                      const Text(
                        "Welcome Back",
                        style: TextStyle(fontSize: 20),
                      ).text.make(),
                      Text(
                        "We are excited to have you back!",
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        "OMED",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    CustomTextField(
                      textEditingController: controller.emailController,
                      hint: "Enter your Email",
                    ),
                    20.heightBox,
                    CustomTextField(
                      textEditingController: controller.passController,
                      hint: "Enter your Password",
                    ),
                    30.heightBox,
                    10.heightBox,
                    SwitchListTile(
                      value: isDoctor,
                      onChanged: (newValue) {
                        setState(() {
                          isDoctor = newValue;
                        });
                      },
                      title: Text("Sign in as Doctor"),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password?").text.make()),
                    30.heightBox,
                    Custom_Button(
                      childText: "Login",
                      onPress: () async {
                        await controller.loginUser();
                        if (controller.userCredential != null) {
                          if (isDoctor) {
                            Get.to(() => const Myappointments(isDoctor: true));
                          } else {
                            Get.to(Home());
                          }
                        }
                      },
                    ),
                    30.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont have an account?").text.make(),
                        8.widthBox,
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpPage());
                            },
                            child: Text(" Sign Up!",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                                .text
                                .make()),
                      ],
                    )
                  ],
                ),
              )),
            ))
          ],
        ),
      ),
    );
  }
}
