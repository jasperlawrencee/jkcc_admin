import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jkcc_admin/app.dart';
import 'package:jkcc_admin/firebase_options.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'jkcc_admin',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("JKCC Admin");
    setWindowMinSize(const Size(350, 450));
  }
  runApp(const MyApp());
}
