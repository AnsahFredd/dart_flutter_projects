import 'package:cliniq/core/constants/asset_paths.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/features/onboarding/widget/onboarding_page_item.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatefulWidget {
  final PageController? controller;
  final ValueChanged<int>? onPageChanged;

  const OnboardingPageView({super.key, this.controller, this.onPageChanged});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  late PageController _pageViewController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = widget.controller ?? PageController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _pageViewController.dispose();
    }

    super.dispose();
  }

  void _handlePageViewChange(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    // if onpage func isn't null let's notify the parent of the change on page
    if (widget.onPageChanged != null) widget.onPageChanged!(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChange,
            children: [
              OnboardingPageItem(
                image: AssetPath.onboarding1,
                title: "Manage Your Health",
                subtitle:
                    "Track your medical history and prescriptions with ease.",
              ),
              OnboardingPageItem(
                image: AssetPath.onboarding2,
                title: "Consult Experts",
                subtitle:
                    "Book appointments with top-rated specialists in seconds.",
              ),
              OnboardingPageItem(
                image: AssetPath.onboarding1,
                title: "Emergency Care",
                subtitle:
                    "Quick access to SOS services and nearest hospitals. Your safety is our priority 24/7.",
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              final bool isActive = index == _currentPageIndex;
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin:  EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primary : AppColors.divider,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
