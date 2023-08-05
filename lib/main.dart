import 'package:flutter/material.dart';
import 'package:ui_test/screens/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        useMaterial3: true, colorScheme: const ColorScheme.light(
          primary: Colors.white
      ),
      ),
      home: const HomeView(),
    );
  }
}
