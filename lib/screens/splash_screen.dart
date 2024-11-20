import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed('home_page');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Image.asset('data/image/imag.jpg',fit: BoxFit.cover,)
            ),
            Text('\nश्रीमद \n    भगवद \n        गीता',style: GoogleFonts.kalam(fontSize: 65,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
