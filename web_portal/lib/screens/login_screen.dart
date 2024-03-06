import 'package:flutter/material.dart';
import 'package:floating_bubbles/floating_bubbles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FloatingBubbles.alwaysRepeating(
              noOfBubbles: 30,
              colorsOfBubbles: const [
                Colors.white,
                Colors.red,
              ],
              sizeFactor: 0.1,
              opacity: 60,
              speed: BubbleSpeed.slow,
              paintingStyle: PaintingStyle.fill,
              shape: BubbleShape.circle,
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.36, // Set the width to   36% of the screen width
              padding: const EdgeInsets.all(
                  20.0), // Increase padding to make the box smaller
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.6), // Use semi-transparent white for the box
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50), // Add space at the top

                    const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Use black color for the text
                      ),
                    ),

                    const SizedBox(height: 30),
                    FractionallySizedBox(
                      widthFactor:
                          0.8, // Increase width factor to make the box smaller
                      child: 
                      TextField(
                        decoration: 
                        InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: const TextStyle(
                            color:
                                Colors.black, // Use black color for the label
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Curved borders
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Curved borders
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                          filled: true,
                          fillColor: Colors
                              .grey.shade200, // Use grey color for the fill
                        ),
                      ),
                      
                    
                    ),
                    const SizedBox(height: 20),
                    // FractionallySizedBox(
                    //   widthFactor:
                    //       0.8, // Increase width factor to make the box smaller
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //       labelText: 'Password',
                    //       labelStyle: const TextStyle(
                    //         color:
                    //             Colors.black, // Use black color for the label
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius:
                    //             BorderRadius.circular(10.0), // Curved borders
                    //         borderSide: const BorderSide(
                    //             color: Colors.black, width: 2.0),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius:
                    //             BorderRadius.circular(10.0), // Curved borders
                    //         borderSide: const BorderSide(
                    //             color: Colors.black, width: 2.0),
                    //       ),
                    //       filled: true,
                    //       fillColor: Colors
                    //           .grey.shade200, // Use grey color for the fill
                    //     ),
                    //     obscureText: true,
                    //   ),
                    // ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {/* Add login functionality here */},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Colors.black, // Use white color for the text
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          // Use a rounded rectangle border
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      child: const Text('Send OTP'),
                    ),
                    const SizedBox(
                        height:
                            10), // Add some space between the button and the link
                    // TextButton(
                    //   onPressed: () {
                    //     /* Handle the forgot password action here */
                    //   },
                    //   child: const Text(
                    //     'Forgot Password?',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
