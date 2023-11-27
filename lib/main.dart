
import 'package:app_dev_assignment3/Provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/calculatorScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => operation()),
      ],
      child: MaterialApp(
        title: 'Calculator',
        theme: ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(color: Colors.black)
          ),
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        
        textTheme: const TextTheme(
            headlineMedium: TextStyle(color: Colors.white)
          ),
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
        home: Scaffold(body: calculatorScreen()),
      ));
  }
}

