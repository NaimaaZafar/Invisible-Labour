import 'package:flutter/material.dart';
import 'package:invisible_labour_awarness/screens/onboarding2.dart';
import 'package:invisible_labour_awarness/widgets/button.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();

}

class _Onboarding1State extends State<Onboarding1> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration for one full rotation
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/onboarding1.png",
              height: 350,
              width: 400,
            ),
            const SizedBox(height: 20),
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
              'Welcome!!! Do you want to clear task \n               super fast with Mane?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            CustomLoadingIcon(animationController: _animationController)
          ],
        ),
      ),
    );
  }
}


class CustomLoadingIcon extends StatelessWidget {
  final AnimationController animationController;

  const CustomLoadingIcon({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Rotating progress indicator
        SizedBox(
          width: 80,
          height: 80,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: animationController.value * 2 * 3.141592653589793, // Full rotation
                child: child,
              );
            },
            child: const CircularProgressIndicator(
              strokeWidth: 4,
              color: Colors.pink, // Green arc color
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        // Circular button with arrow, wrapped in GestureDetector
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Onboarding2()),
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