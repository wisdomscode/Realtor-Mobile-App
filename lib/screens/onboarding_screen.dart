import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/house6.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          child: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Discover Your \nDream Home', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey),
          ),
        )
      ],
    ));
  }
}
