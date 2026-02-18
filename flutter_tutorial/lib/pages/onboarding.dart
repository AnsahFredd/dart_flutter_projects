import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/lotties/welcome.json", height: 300.0),
                Text(
                  "Your friendly companion for learning Flutter development. Build real apps, practice coding, and master mobile development at your own pace.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    letterSpacing: 0.3,
                    color: Colors.grey[700]
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.0),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: "Register");
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Next'),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
