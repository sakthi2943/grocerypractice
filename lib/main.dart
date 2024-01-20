import 'package:flutter/material.dart';
import 'features/home/ui/home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 230, 158, 158)),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: Home(),
    );
  }
}
