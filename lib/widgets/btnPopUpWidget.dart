import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPopUpBtn extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  CustomPopUpBtn(
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
        onPressed: () async {
          buttonPressed();
          Get.defaultDialog(
              title: '',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'My name',
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 4.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(_controller.text);
                    },
                    child: const Text(
                      'ADD NAME',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ));
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
