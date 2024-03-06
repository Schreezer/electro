import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Create Animation Controller
    _controller = AnimationController(
      vsync: this, // Required for SingleTickerProviderStateMixin
      duration: const Duration(seconds: 2),
    );

    // Create opacity animation
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _opacityAnimation.value,
              child: const Text(
                "Generate your electricity bill here",
      
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Welcome to the Web Portal",
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
      
                    decoration: TextDecoration.none, // Remove underline
                  ),
                ),
              ],
              totalRepeatCount: 1,
              repeatForever: false,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              onTap: () {
                // print('Text pressed');
              },
              onFinished: () {
                // print('Animation finished');
              },
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("Login"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },child: const Text("Register")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}