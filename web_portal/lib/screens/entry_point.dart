import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:web_portal/screens/home_screen.dart";
import "package:web_portal/screens/welcome_screen.dart";

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        return const WelcomeScreen();
      },
    );
  }
}
