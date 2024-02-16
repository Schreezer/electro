import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For number input formatting

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for validation
  final _nameController = TextEditingController();
  final _blockNumberController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is removed
    _nameController.dispose();
    _blockNumberController.dispose();
    _houseNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Registeration", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,))),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _blockNumberController,
                  decoration: const InputDecoration(labelText: 'Block Number (Capital)'),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[A-Z]')), // Allow only uppercase
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your block number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _houseNumberController,
                  decoration: const InputDecoration(labelText: 'House Number'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only numbers
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your house number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add email pattern validation if needed
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true, // Hide password characters
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Add more password strength validation criteria
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If all fields are valid, process registration
                        // (Example: Send data to backend, navigate to a different screen)
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50), // Make the button bigger
                    ),
                    child: const Text('Register', style: TextStyle(fontSize: 18),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
