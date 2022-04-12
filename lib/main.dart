import 'package:flutter/material.dart';
import 'package:pdpui_3/pages/intro.dart';

import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const intro(),
      routes: {
        home.id: (context) => home(),
        intro.id: (context) => intro(),

      },
    );
  }
}

