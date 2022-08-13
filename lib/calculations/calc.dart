import 'package:flutter/material.dart';

abstract class CalcHours extends StatelessWidget {
  const CalcHours({Key? key, required hour, required days}) : super(key: key);

  final int hour = 8;
  final int days = 1;
  print(hour, days);
}
