import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../layouts/layout_builder.dart';
import 'login_screen.dart';

class UserLogCheckScreen extends StatelessWidget {
  const UserLogCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoginScreen();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const CustomLayoutBuilder();
      },
    );
  }
}
