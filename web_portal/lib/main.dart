import 'package:flutter/material.dart';
import 'package:web_portal/providers/userProvider.dart';
import 'package:web_portal/screens/entry_point.dart';
import 'package:web_portal/screens/home_screen.dart';
import 'package:web_portal/screens/login_screen.dart';
import 'package:web_portal/screens/profile_screen.dart';
import 'package:web_portal/screens/register_screen.dart';
import 'package:web_portal/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyB6HTwi_8Lyixn_HvFnUquzZy5oS0rLqwk',
    appId: '1:973996384416:web:70336c664d112e9acce9c5',
    messagingSenderId: '973996384416',
    projectId: 'billmanagement-99681',
    storageBucket: 'billmanagement-99681.appspot.com',
  ));
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var initial_route= '/';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      // Check if the user is already logged in
      UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.refreshUser(true);
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark, // Set the theme brightness to dark
          textTheme: const TextTheme(
            bodyText1:
                TextStyle(color: Colors.white), // Set the text color to white
          ),
        ),
        initialRoute: initial_route,
        routes: {
          '/' : (context) => const EntryPoint(),
          '/welcome': (context) => const WelcomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegistrationScreen(),
          '/home': (context) => const HomeScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
        // home: const WelcomeScreen(),
      ),
    );
  }
}
