import 'package:databse_cruid/pages/api_call.dart';
import 'package:databse_cruid/pages/lab7.dart';
import 'package:databse_cruid/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: Apicall()
    );
  }
}
