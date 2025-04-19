import 'package:flutter/material.dart';
import 'package:invisible_labour_awarness/screens/login.dart';
import 'package:invisible_labour_awarness/screens/onboarding1.dart';
import 'package:invisible_labour_awarness/screens/signup.dart';

import '../widgets/button.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/onboarding3.png",
              height: 350,
              width: 400,
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Our fearless leader Ayra Alamdar \n left us alone",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'It has been easir to complete tasks. \n             Get started with us!',
            ),
            const SizedBox(height: 20),
            Button(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              text: 'Get Started',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen(onTap:null)),
                    );
                  },  // Calls togglePages() from LoginOrRegister
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}