import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uietconnect/files/userProfile/uploaddata.dart';
import 'files/login/screens/signin_screen.dart';
import 'files/login/screens/welcome_screen.dart';
import 'firebase_options.dart';
import 'homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final storage = const FlutterSecureStorage();
  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: 'uid');
    if (value == null) {
      return false;
    }
    return true;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue.shade400,
          shadowColor: Colors.blue.shade200,
          splashColor: Colors.black12),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: checkLoginStatus(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == false) {
              return const WelcomeScreen();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  color: Colors.white,
                  child: const Center(child: CircularProgressIndicator()));
            }
            return const Homepage();
          }),
      // home: const Homepage(),
      // home: const WelcomeScreen(),
    );
  }
}
