import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_doctor_booking/consts/consts.dart';
import 'package:online_doctor_booking/controller/authcontroller.dart';
import 'package:online_doctor_booking/resources/components/custom_button.dart';
import 'package:online_doctor_booking/resources/components/custom_textField.dart';
import 'package:online_doctor_booking/views/home_view/home.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                        padding: const EdgeInsets.all(0.0),
                        child: Image.asset('assets/images/signup.png'),
                      ),
                      20.heightBox,
                      Text(
                        "Sign Up now and start exploring all that our app has to offer!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ).text.make(),
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
                      hint: "Enter an username",
                      textEditingController: controller.usernameController,
                    ),
                    20.heightBox,
                    CustomTextField(
                      hint: "Enter your Email",
                      textEditingController: controller.emailController,
                    ),
                    30.heightBox,
                    CustomTextField(
                      hint: "Enter your Password",
                      textEditingController: controller.passController,
                    ),
                    30.heightBox,
                    SwitchListTile(
                        title: "Sign Up as a Doctor".text.make(),
                        value: isDoctor,
                        onChanged: (newValue) {
                          setState(() {
                            isDoctor = newValue;
                          });
                        }),
                    Visibility(
                      visible: isDoctor,
                      child: Column(
                        children: [
                          CustomTextField(
                            hint: "Enter your Category",
                            textEditingController:
                                controller.doctorCategoryController,
                          ),
                          30.heightBox,
                          CustomTextField(
                            hint: "Enter your Services",
                            textEditingController:
                                controller.doctorServicesController,
                          ),
                          30.heightBox,
                          CustomTextField(
                            hint: "Enter your Phone Number",
                            textEditingController:
                                controller.doctorPhoneController,
                          ),
                          30.heightBox,
                          CustomTextField(
                            hint: "Enter your Timing",
                            textEditingController:
                                controller.doctorTimingController,
                          ),
                          30.heightBox,
                          CustomTextField(
                            hint: "Enter your Address",
                            textEditingController:
                                controller.doctorAddressController,
                          ),
                          30.heightBox,
                          CustomTextField(
                            hint: "Enter About",
                            textEditingController:
                                controller.doctorAboutController,
                          ),
                          30.heightBox,
                        ],
                      ),
                    ),
                    30.heightBox,
                    Custom_Button(
                      childText: "Sign Up",
                      onPress: () async {
                        await controller.signUpUser();
                        if (controller.userCredential != null) {
                          Get.to(() => Home());
                        }
                      },
                    ),
                    30.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?").text.make(),
                        8.widthBox,
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              " Sign In!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ).text.make()),
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
