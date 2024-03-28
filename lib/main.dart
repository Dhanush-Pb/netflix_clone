import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts'; // Commented out the Google Fonts import
import 'package:lottie/lottie.dart';
import 'package:netflix/Homepage.dart';
import 'package:netflix/New&Hot.dart';
import 'package:netflix/searchscreen.dart';
import 'package:netflix/spalshscrren.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Searchpage();
    const Homepage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        // ignore: deprecated_member_use
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splashscreen(), // Set SplashScreen as home screen
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Searchpage();
    NetflixNewAndHotPage();
    const Homepage();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavPage()));
      // Your code to execute after 4 seconds goes here
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 6),
        child: Lottie.asset(
          'lib/asset/Animation - 1711432641184.json', // Replace 'animation.json' with your animation file
          width: 400, // Adjust width as needed
          height: 400, // Adjust height as needed
          fit: BoxFit.cover, // Adjust the fit as needed
        ),
      ),
    );
  }
}
