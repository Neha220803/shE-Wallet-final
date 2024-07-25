// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sample/Pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 1, 69, 132),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: const {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}
