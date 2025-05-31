import 'package:ama_meet/resources/auth_methods.dart';
import 'package:ama_meet/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeedf2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),
          ),
          Lottie.asset('assets/animations/hellow_world.json'),
          CustomBtn(text: 'Google Sign In', onPressedFunction: () async{

            bool result = await _authMethods.signInWithGoogle(context);

            if(result) {
              Navigator.pushNamed(context, '/home');
            }
          },),
        ],
      ),
    );
  }
}  