import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:women_saftey/child/bottom_screen.dart';
import 'package:women_saftey/db/shared_pref.dart';
import 'package:women_saftey/child/bottom_screens/home_screen.dart';
import 'package:women_saftey/child/login_screen.dart';
import 'package:women_saftey/parent/parent_home_screen.dart';
import 'package:women_saftey/utils/constants.dart';

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
  await MySharedPreference.init();
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
      home:FutureBuilder(
          future: MySharedPreference.getUserType(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data==""){
              return BottomPage();
            }
            if(snapshot.data=="child"){
              return BottomPage();
            }
            if(snapshot.data=="parent"){
              return ParentHomeScreen();
            }
            return progressIndicator(context);
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   // Show a loading indicator while waiting for the data
            //   return progressIndicator(context);
            // }
            // if (snapshot.hasError) {
            //   // Handle any errors that occur during the data retrieval process
            //   return Text('Error: ${snapshot.error}');
            // }
            // // Check if the snapshot has data
            // if (snapshot.hasData) {
            //   // Get the user type from SharedPreferences
            //   String userType = snapshot.data!;
            //   // Check the user type and return the appropriate screen
            //   if (userType.isEmpty) {
            //     return LoginScreen();
            //   } else if (userType == "child") {
            //     return BottomPage();
            //   } else if (userType == "parent") {
            //     return ParentHomeScreen();
            //   }
            // }
            // // Return a default screen if no user type is found
            // return LoginScreen();
          }
      )

    );
  }
}