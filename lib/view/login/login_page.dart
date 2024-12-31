import 'package:flutter/material.dart';
import 'package:news_app/view/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key}) ;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SizedBox(height: 20),
                 
                 LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


