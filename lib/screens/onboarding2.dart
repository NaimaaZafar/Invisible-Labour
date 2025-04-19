import 'package:flutter/material.dart';
import 'package:invisible_labour_awarness/screens/onboarding3.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Image.asset(
              "assets/onboarding2.png",
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
            const SizedBox(height: 25),
            const Text(
              'Easily arrange work order for you to manage \n many functions to choose!',
            ),
            const SizedBox(height: 20),
            CustomLoadingIcon(),
          ],
        ),
      ),
    );
  }
}


class CustomLoadingIcon extends StatelessWidget {

  const CustomLoadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Rotating progress indicator
        // Circular button with arrow, wrapped in GestureDetector
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Onboarding3()),
            );
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo, // Background color of the circle
            ),
            child: const Icon(
              Icons.arrow_forward, // Arrow icon
              size: 30,
              color: Colors.white, // Arrow icon color
            ),
          ),
        ),
      ],
    );
  }
}