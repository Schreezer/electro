import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:web_portal/providers/userProvider.dart';
import 'package:web_portal/resources/authMethods.dart';
import 'package:web_portal/screens/home_screen.dart';
import 'package:web_portal/widgets/snackbar.dart';
import 'package:web_portal/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool phoneValid = false;
  bool _isLoading1 = false;
  bool _isLoading2 = false;
  bool otpSent = false;
  Timer? _timer;
  int _start = 900;

  Future<bool> sendOtp() async {
    // should work on the logic of sending otp TODO: Test this function
    print(_phoneNumberController.text);
    setState(() {
      _isLoading1 = true;
    });
    String res =
        await AuthMethods().Send_OTP(phone: _phoneNumberController.text);

    print(res);
    if (res == 'code sent') {
      showSnackBar(context, res);
      setState(() {
        _isLoading1 = false;
      });
      return true;
    } else {
      showSnackBar(context, res);
      setState(() {
        _isLoading1 = false;
      });
      return false;
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer?.cancel(); // Cancel any previous timer
    setState(() {
      _start = 900; // Reset the timer to 60 seconds
    });
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void resetTimer() {
    setState(() {
      _timer?.cancel();
      _start = 60; // Reset the timer to 60 seconds
    });
  }
    Future<void> next(Provider) async {
    // ignore: unused_local_variable
    var res = 'otp entered';
    setState(() {
      _isLoading2 = true;
    });
    await AuthMethods()
        .Login_otp_submit(_otpController.text)
        .then((value) => res = value);

    if (res == 'success') {
      if (!context.mounted) return;
      showSnackBar(context, res);

      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      String? uid = auth.currentUser?.uid.toString();
      // G_uid = uid!;
      // PhoneNumber = _phoneNumberController.text;
      final snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      print("the snapshot is ${snapshot.data()}");
      if (snapshot.data() == null || !snapshot.exists) {
        showSnackBar(context, "user does not exist");
        if (!context.mounted) return;
        Provider.refreshUser(false);
        // PhoneNumber = _phoneNumberController.text;
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => RegistrationScreen(
        //         phoneN: _phoneNumberController.text, uid: uid!),
        //   ),
        // );
      } else {
        showSnackBar(context, "user exists");
        if (!context.mounted) return;
        Provider.refreshUser(false);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ));
        // html.window.location.reload();
        // Restart.restartApp();
      }
    } else {
      if (!context.mounted) return;
      showSnackBar(context, res);
    }
    setState(() {
      _isLoading2 = false;
    });
  }
  void dispose() {
    _timer?.cancel();
    super.dispose();

    _phoneNumberController.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: Divider.createBorderSide(context),
    );
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
              height: MediaQuery.of(context).size.height *
                  0.8, // Set the height to 60% of the screen height
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
                      child: IntlPhoneField(
                        // controller: _phoneNumberController,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter your phone number';
                          }
                          if (value.isValidNumber()) {
                            print("the phone number is valid");
                            setState(() {
                              phoneValid = true;
                              _phoneNumberController.text =
                                  value.completeNumber;
                            });
                          }
                          if (!value.isValidNumber()) {
                            print("the phone number is not valid");
                            setState(() {
                              phoneValid = false;
                            });
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText:
                              'Phone Number', // Use label instead of hint for a cleaner look
                          filled: true,
                          fillColor:
                              Colors.black, // Fill color for the text field
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal:
                                  15.0), // Increased padding for the text field
                          prefixIcon:
                              Icon(Icons.phone), // Icon for phone number field
                        ),
                        keyboardType: TextInputType.phone,
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          setState(() {
                            _phoneNumberController.text = phone.completeNumber;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    phoneValid
                        ? ElevatedButton(
                            onPressed: _isLoading1
                                ? null
                                : () async {
                                    // Disable button when loading
                                    setState(() {
                                      _isLoading1 = true;
                                    });
                                    if (phoneValid) {
                                      bool otpResult = await sendOtp();
                                      if (otpResult) {
                                        setState(() {
                                          otpSent = true;
                                        });
                                        resetTimer();
                                        startTimer();
                                        showSnackBar(context,
                                            "OTP sent to ${_phoneNumberController.text}");
                                      } else {
                                        showSnackBar(context,
                                            "Please enter a valid phone number");
                                      }
                                    } else {
                                      showSnackBar(context,
                                          "Please enter a valid phone number");
                                    }
                                    setState(() {
                                      _isLoading1 = false;
                                    });
                                  },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 15), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Rounded corners for the button
                              ),
                            ),
                            child: _isLoading1
                                ? CircularProgressIndicator()
                                : Text("Request OTP"),
                          )
                        : Container(),
                    const SizedBox(
                        height: 10), 
                        
                        // Add some space between the button and the link
                        if (otpSent) ...[
                  SizedBox(height: 20),
                  Text(
                    "OTP will expire in $_start seconds",
                    style: TextStyle(
                        color: Colors.red[900]), // Set the color to dark red
                  ),
                ],
                  if (otpSent) ...[
                  // Only show OTP field if OTP has been sent
                  SizedBox(height: 20),
                  TField(
                    hText: "Enter OTP",
                    controller: _otpController,
                    preIcon: Icon(Icons.lock_outline), // Icon for OTP field
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isLoading2
                        ? null
                        : () {
                            next(userProvider);
                          },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: _isLoading2
                        ? CircularProgressIndicator()
                        : Text("Submit OTP"),
                  ),
                ],
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
