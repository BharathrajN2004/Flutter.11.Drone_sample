import 'package:flutter/material.dart';

import './Pages/Splash.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Harpy",
      theme: ThemeData(fontFamily: 'Laila'),
      home: Splash(),
    );
  }
}
