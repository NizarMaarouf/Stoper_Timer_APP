// ignore_for_file: prefer_const_constructors, sort_child_properties_last

// by NizarMaarouf

import 'package:flutter/material.dart';
import 'package:stoper_timer_app/Widget/Counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoperTimerApp(),
    );
  }
}
