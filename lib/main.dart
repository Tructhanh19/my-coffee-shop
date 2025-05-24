import 'package:coffee_shop/home/main_coffee_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MainCoffeePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
