import "package:flutter/material.dart";

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vakantie overzicht pagina"),
        backgroundColor: Colors.blueGrey,
      ),
      body: const SafeArea(
        child: Center(child: Text("Overzicht verlof en ADV")),
      ),
    );
  }
}
