// import 'package:firebase_core/firebase_core.dart';
import 'package:diet_app/view/middleware/tes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/v_home.dart';
import 'package:get/get.dart';
import 'package:diet_app/view/middleware/screen_signup.dart';
import 'package:diet_app/view/middleware/screen_signIn.dart';
import 'package:diet_app/view/profile/profile.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
      routes: {
        "/==>login": (context) => SignInPage(),
        "/==>signup": (context) => SignUpPage(),
        "/==>home": (context) => DietAppHome(),
        "/==>profile": (context) => ProfilePage(),
      },
    );
  }
}
