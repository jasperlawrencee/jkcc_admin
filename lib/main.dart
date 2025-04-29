import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jkcc_admin/app.dart';
import 'package:jkcc_admin/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'jkcc_admin',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
