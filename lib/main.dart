import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_first_app/pages/restaurants/restaurant_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T A B L E',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RestaurantOne(),
    );
  }
}
