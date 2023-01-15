import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:testing_widgets/Screen/grid_screen.dart';

import 'Screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == GridScreen.nameRoute) {
          final args = settings.arguments as List;
          return MaterialPageRoute(
            builder: (context) {
              return GridScreen(m: args[0], n: args[1], alphabates: args[2]);
            },
          );
        }
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => InputPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/logo1.png',
          width: 300,
        ),
        const SizedBox(
          height: 40,
        ),
        SpinKitSpinningLines(
          color: Colors.orange.shade600,
          size: 50,
        ),
      ]),
    );
  }
}
