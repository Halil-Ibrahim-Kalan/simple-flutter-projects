import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:project/home.dart';
// ignore: unused_import
import 'package:project/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const Page2(),
    );
  }
}
