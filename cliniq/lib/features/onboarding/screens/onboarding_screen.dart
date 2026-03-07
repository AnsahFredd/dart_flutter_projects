import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/auth/presentation/screens/login_screen.dart';
import 'package:cliniq/features/onboarding/widget/onboarding_page_view.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageViewController = PageController();
  int _currentPageIndex = 0;
  final int totalPage = 3;

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _onSkipPressed,
                    child: Text(
                      "SKIP",
                      style: AppText.titleSmall.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: OnboardingPageView(
                controller: _pageViewController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: _onNextPreesed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.surface,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.all(8.0),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _currentPageIndex == totalPage - 1
                          ? "Get Started"
                          : "Next",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 22),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _onNextPreesed() {
    if (_currentPageIndex < totalPage - 1) {
      if (_pageViewController.hasClients) {
        _pageViewController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }
}
