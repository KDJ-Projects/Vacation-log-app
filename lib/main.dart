import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:verlof_dagen_app/screens/verlofInput.dart';
import 'package:verlof_dagen_app/screens/verlofOverzicht.dart';

import 'widgets/btnWidget.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("dayBox");
  await Hive.openBox("hourBox");
  await Hive.openBox("advBox");

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Vakantie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("lib/assets/images/vacation2.png"),
            CustomButton(
              btnText: 'Inbreng snipper / ADV',
              height: 50,
              btnColor: Colors.grey,
              txtColor: Colors.white,
              txtSize: 20.0,
              buttonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VacationInputScreen(),
                  ),
                );
              },
            ),
            CustomButton(
              btnText: 'Overzicht verlof en ADV dagen',
              height: 50,
              btnColor: Colors.grey,
              txtColor: Colors.white,
              txtSize: 20.0,
              buttonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OverviewScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
