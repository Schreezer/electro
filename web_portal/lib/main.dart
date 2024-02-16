import 'package:flutter/material.dart';
import 'package:web_portal/screens/login_screen.dart';
import 'package:web_portal/screens/register_screen.dart';
import 'package:web_portal/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark, // Set the theme brightness to dark
        textTheme: TextTheme(
          bodyText1:
              TextStyle(color: Colors.white), // Set the text color to white
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
      },
    );
  }
}
