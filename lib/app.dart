import 'package:flutter/material.dart';
import 'package:jkcc_admin/components/constants.dart';
import 'package:jkcc_admin/pages/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JKCC Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Colors.black54),
          headlineMedium: TextStyle(color: Colors.black54),
          headlineSmall: TextStyle(color: Colors.black54),
          bodyLarge: TextStyle(color: Colors.black54),
          bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
          bodySmall: TextStyle(color: Colors.black54),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.all(defaultPadding),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
          hintStyle: TextStyle(fontSize: 14),
          errorStyle: TextStyle(color: Colors.red, fontSize: 12),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            textStyle: TextStyle(decoration: TextDecoration.none),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: LoginPage(),
    );
  }
}
