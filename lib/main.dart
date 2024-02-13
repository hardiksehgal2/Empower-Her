import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:women_saftey/home_screen.dart';
import 'package:women_saftey/child/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAF7t0nAY-hAU6RPUE7BeB6uSBbJdoCyvo",
        authDomain: "women-safety-bced8.firebaseapp.com",
        projectId: "women-safety-bced8",
        storageBucket: "women-safety-bced8.appspot.com",
        messagingSenderId: "796783843913",
        appId: "1:796783843913:web:2cd1bec26fcfae2b013d98",
        measurementId: "G-J1289V5ZST"
    ),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.abelTextTheme(),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
