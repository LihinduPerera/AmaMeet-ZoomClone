import 'package:ama_meet/pages/home_page.dart';
import 'package:ama_meet/pages/login_page.dart';
import 'package:ama_meet/resources/auth_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ama Meet',
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasData) {
            return const HomePage();
          }

          return const LoginPage();
        },
      ),
    );
  }
}

