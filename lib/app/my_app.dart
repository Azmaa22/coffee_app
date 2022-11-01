import 'package:coffee_app/feature/coffee/presentation/screen/coffee_home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const CoffeeHomeScreen(),
    );
  }
}
