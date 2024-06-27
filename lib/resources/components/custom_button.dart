import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Custom_Button extends StatelessWidget {
  final Function()? onPress;
  final String childText;
  Custom_Button({super.key, required this.childText, this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth - 60,
      height: 44,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
          ),
          onPressed: onPress,
          child: childText.text.make()),
    );
  }
}
