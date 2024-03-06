import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For number input formatting

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(8.0), // Decreased padding
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height:   30), // Decreased space at the top
                const Text(
                  "Registration",
                  style: TextStyle(fontSize:   24, fontWeight: FontWeight.bold), // Decreased font size
                ),
                const SizedBox(height:   10), // Decreased space between fields
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true, // Use isDense to reduce height
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height:   10), // Decreased space between fields
                TextFormField(
                  controller: _blockNumberController,
                  decoration: InputDecoration(
                    labelText: 'Block Number (Capital)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true, // Use isDense to reduce height
                  ),
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
                const SizedBox(height:   10), // Decreased space between fields
                TextFormField(
                  controller: _houseNumberController,
                  decoration: InputDecoration(
                    labelText: 'House Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true, // Use isDense to reduce height
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only numbers
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your house number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height:   10), // Decreased space between fields
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true, // Use isDense to reduce height
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add email pattern validation if needed
                    return null;
                  },
                ),
                const SizedBox(height:   10), // Decreased space between fields
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true, // Use isDense to reduce height
                  ),
                  obscureText: true, // Hide password characters
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Add more password strength validation criteria
                    return null;
                  },
                ),
                const SizedBox(height:   10), // Decreased space between fields
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If all fields are valid, process registration
                        // (Example: Send data to backend, navigate to a different screen)
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.black, // Use white color for the text
                      minimumSize: const Size(150,   40), // Decreased button size
                      shape: RoundedRectangleBorder( // Use a rounded rectangle border
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle: const TextStyle(
                        fontSize:   14, // Decreased font size
                      ),
                    ),
                    child: const Text('Register', style: TextStyle(fontSize:   14),), // Decreased font size
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