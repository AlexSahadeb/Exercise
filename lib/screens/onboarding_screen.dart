import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:morning_exercises/screens/home_screen.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "Triceps/Military-Style Push-Ups",
      body:
          "The Army push-up is different than other push-ups. For an Army push-up, you must take the weight off your hands when at the lower position in between repetitions.",
      image: Center(
          child: Lottie.asset("assets/files/screen1.json", height: 175.0)),
      decoration: const PageDecoration(
          pageColor: Color(0XFFF5F5F5),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
          bodyTextStyle: TextStyle(color: Colors.black, fontSize: 16)),
    ),
    PageViewModel(
      title: "Squat & High Reach",
      body:
          "These squat quotes will inspire you. A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up.",
      image: Center(
          child: Lottie.asset("assets/files/screen2.json", height: 175.0)),
      decoration: const PageDecoration(
          pageColor: Color(0XFFF5F5F5),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
          bodyTextStyle: TextStyle(color: Colors.black, fontSize: 16)),
    ),
    PageViewModel(
      title: "Deadbug fitness exercise",
      body:
          "Lift your legs so your knees are directly over your hips. On an exhale, slowly lower your right arm and left leg until they're just above the floor. On an inhale, bring them back to the starting position. Repeat on the opposite side.",
      image: Center(
          child: Lottie.asset("assets/files/screen3.json", height: 175.0)),
      decoration: const PageDecoration(
          pageColor: Color(0XFFF5F5F5),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
          bodyTextStyle: TextStyle(color: Colors.black, fontSize: 16)),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
        onSkip: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
        showBackButton: false,
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Text("Next"),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.deepOrange,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      )),
    );
  }
}
