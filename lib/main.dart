import 'package:flutter/material.dart';
import 'package:my_first_app/home/main_table_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainTablePage(),
    );
  }
}
 