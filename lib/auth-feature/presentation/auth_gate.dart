import 'package:e_commerce/auth-feature/presentation/get_started_page.dart';
import 'package:e_commerce/product-feature/presentation/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Waiting for Firebase
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // User NOT logged in
        if (!snapshot.hasData) {
          return const GetStartedPage();
        }

        // User LOGGED IN
        return const HomePage();
      },
    );
  }
}
