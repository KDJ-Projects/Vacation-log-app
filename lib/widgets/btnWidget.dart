import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.btnText,
      required this.height,
      required this.btnColor,
      required this.txtColor,
      required this.txtSize,
      required this.buttonPressed});

  final String btnText;
  final double height;
  final Color btnColor;
  final Color txtColor;
  final double txtSize;
  final Function buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: btnColor,
      ),
      child: MaterialButton(
        onPressed: () {
          buttonPressed();
        },
        child: Text(
          btnText,
          style: TextStyle(
            color: txtColor,
            fontSize: txtSize,
            // color: Colors.red,
          ),
        ),
      ),
    );
  }
}
