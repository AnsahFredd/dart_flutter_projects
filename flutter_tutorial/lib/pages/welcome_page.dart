import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/login_page.dart';
import 'package:flutter_tutorial/pages/onboarding.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/lotties/waves.json", height: 400.0),
                FittedBox(
                  child: Text(
                    "Flutter Mapp",
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 50.0,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Onboarding();
                        },
                      ),
                    );
                  },
                  child: Text("Get started"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: "Login",);
                        },
                      ),
                    );
                  },
                  child: Text("Log in"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
