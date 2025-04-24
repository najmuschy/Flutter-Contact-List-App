import 'package:flutter/material.dart';
import 'package:contacts_app/Home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(102, 124, 137, 1),
          centerTitle: true ,
        )
      ),
      home: Home(),
    );
  }
}
