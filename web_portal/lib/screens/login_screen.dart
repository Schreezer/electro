import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(40.0), 
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center, // Consider adjusting
            crossAxisAlignment: CrossAxisAlignment.center, // Consider adjusting
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), 
              const FractionallySizedBox(
                widthFactor: 0.5,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(height: 20), 
              const FractionallySizedBox(
                widthFactor: 0.5,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30), 
              ElevatedButton( 
                onPressed: () { /* Add login functionality here */ },
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  // Styling options for elevated button (optional)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

