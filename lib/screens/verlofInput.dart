import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/btnWidget.dart';

class VacationInputScreen extends StatefulWidget {
  const VacationInputScreen({Key? key}) : super(key: key);

  @override
  State<VacationInputScreen> createState() => _VacationInputScreenState();
}

class _VacationInputScreenState extends State<VacationInputScreen> {
  final TextEditingController _inputDayController = TextEditingController();
  final TextEditingController _inputHourController = TextEditingController();
  final TextEditingController _inputAdvController = TextEditingController();

  //! From Get popup test
  final TextEditingController _controller = TextEditingController();

  //! From PopUp Test
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _num = "id_";
  var _id = 0;

  String currentText = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vakantie Ingave"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
                child: TextField(
                  controller: _inputDayController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Aantal vakantiedagen"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
                child: TextField(
                  controller: _inputHourController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Aantal vakantie uren"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
                child: TextField(
                  controller: _inputAdvController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Aantal ADV dagen"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              CustomButton(
                  height: 44,
                  btnText: 'INVOEREN',
                  btnColor: Colors.green,
                  txtColor: Colors.white70,
                  txtSize: 20.0,
                  buttonPressed: () {
                    inputDays();
                    inputHoures();
                    inputAdv();
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              CustomButton(
                  height: 44,
                  btnText: 'SHOW SUM HOURS',
                  btnColor: Colors.blue,
                  txtColor: Colors.white70,
                  txtSize: 20.0,
                  buttonPressed: () {
                    showSumHours();
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              CustomButton(
                  height: 44,
                  btnText: 'SHOW ALL DATA',
                  btnColor: Colors.blue,
                  txtColor: Colors.white70,
                  txtSize: 20.0,
                  buttonPressed: () {
                    showData();
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              CustomButton(
                  height: 44,
                  btnText: 'DELETE DATA',
                  btnColor: Colors.red,
                  txtColor: Colors.white70,
                  txtSize: 20.0,
                  buttonPressed: () {
                    deleteData();
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              //! Test Button
              CustomButton(
                btnText: 'TEST POPUP BUTTON',
                height: 44,
                btnColor: Colors.purple,
                txtColor: Colors.white,
                txtSize: 16,
                buttonPressed: () async {
                  // await ShowInformationDialog(context);
                  Get.defaultDialog(
                      content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: _inputDayController,
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
                          print(_inputDayController.text);
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> inputDays() async {
    var daysBox = Hive.box("dayBox");
    daysBox.put("$_num$_id", _inputDayController.text);
    var days = daysBox.get("days");
    _id++;
    print(days);
    var day = daysBox.toMap();
    print("Aantal dagen: $day");
    _inputDayController.clear();
  }

  Future<void> inputHoures() async {
    var hourBox = Hive.box("hourBox");
    hourBox.put("houres", _inputHourController.text);
    String houres = hourBox.get("houres");
    print(houres);
    var hour = hourBox.toMap();
    print(hour);
    _inputHourController.clear();
  }

  Future<void> inputAdv() async {
    var advBox = Hive.box("advBox");
    advBox.put("adv_dagen", _inputAdvController.text);
    String advdagen = advBox.get("adv_dagen");
    print(advdagen);
    var adv = advBox.length;
    print("ADV lengte: $adv");
    _inputAdvController.clear();
  }

  Future<int> showSumHours() async {
    var daysbox = Hive.box("dayBox");
    var listDays = daysbox.values;
    final listDaysInt = listDays.map((dynamic e) => int.parse(e)).toList();
    var sumDays = listDaysInt.reduce((sum, element) => sum + element);
    print(sumDays);
    final sumDayss = await sumDays;
    return sumDayss;
  }

  Future<void> showData() async {
    var daysBox = Hive.box("dayBox");
    var hourBox = Hive.box("hourBox");
    var advBox = Hive.box("advBox");
    var dayData = daysBox.toMap();
    // var houreData = hourBox.toMap();
    // var advData = advBox.toMap();
    print("Day data: $dayData");
    // print(houreData);
    // print(advData);
  }

  Future<void> deleteData() async {
    var daysBox = Hive.box("dayBox");
    var hourBox = Hive.box("hourBox");
    var advBox = Hive.box("advBox");
    daysBox.clear();
    hourBox.clear();
    advBox.clear();
    print(daysBox.values);
    print(hourBox.values);
    print(advBox.values);
    print(hourBox.length);
  }
  //! PopUp test
  // Future<void> ShowInformationDialog(BuildContext context) async {
  //   return await showDialog(
  //       context: context,
  //       builder: (context) {
  //         // final TextEditingController _inputDayController =
  //         //     TextEditingController();

  //         return AlertDialog(
  //           content: Form(
  //             key: _formKey,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextFormField(
  //                   controller: _inputDayController,
  //                   validator: (value) {
  //                     return value!.isNotEmpty ? null : 'Geef dagen in!';
  //                   },
  //                   decoration:
  //                       const InputDecoration(hintText: 'Geef verlofdagen in'),
  //                 )
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //               child: const Text('Invoeren'),
  //               onPressed: () {
  //                 if (_formKey.currentState!.validate()) {
  //                   Navigator.of(context).pop();
  //                   inputDays();
  //                 }
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
}
