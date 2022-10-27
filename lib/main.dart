import 'package:flutter/material.dart';
import 'package:morning_exercises/screens/home_screen.dart';
import 'package:morning_exercises/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  initScreen = await preferences.getInt(
    "initScreen",
  );
  await preferences.setInt("initScreen", 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:
          initScreen == 0 || initScreen == null ? "onBording" : "home",
      routes: {
        "home": (context) => const HomeScreen(),
        "onBording": (context) => const OnBordingScreen()
      },
    );
  }
}
