import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uietconnect/homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue.shade400,
        shadowColor: Colors.blue.shade200,
        splashColor: Colors.black12
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage() ,
    );
  }
}
