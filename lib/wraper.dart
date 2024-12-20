import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Dashboard/Dashboard.dart';
import 'Login and Signup/login.dart';
import 'Login and Signup/verify.dart';

class Wraper extends StatefulWidget {
  const Wraper({super.key});

  @override
  State<Wraper> createState() => _WraperState();
}

class _WraperState extends State<Wraper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            print('User signed in: ${snapshot.data}');
            if (snapshot.data!.emailVerified) {
              print('User email is verified.');
              return const Dashboard();
            } else {
              print('User email is not verified.');
              return const VerifyPage();
            }
          } else {
            print('No user is signed in.');
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
