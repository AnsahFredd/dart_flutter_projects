import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/features/auth/presentation/screens/login_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/register_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/reset_passwrod_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/verification_screen.dart';
import 'package:cliniq/features/emergency/presentation/screens/emergency_screen.dart';
import 'package:cliniq/features/find_doctor/presentation/screens/find_doctor.dart';
import 'package:cliniq/features/medical_records/presentation/pages/reports_history_page.dart';
import 'package:cliniq/features/messages/presentation/screens/messages_screen.dart';
import 'package:cliniq/features/notifications/presentation/pages/notifications_page.dart';
import 'package:cliniq/features/onboarding/screens/onboarding_screen.dart';
import 'package:cliniq/features/profile/presentation/screens/profile_screen.dart';
import 'package:cliniq/features/splash/presentation/screens/splash_screen.dart';
import 'package:cliniq/screens/main_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.resetpassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.verifyCode:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case Routes.maainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.appointments:
        // return MaterialPageRoute(builder: (_) => const AppointmentsListPage());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.medicalrecords:
        return MaterialPageRoute(builder: (_) => const ReportsHistoryPage());
      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsPage());
        case Routes.messages:
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
        case Routes.emergency:
        return MaterialPageRoute(builder: (_) => const EmergencyScreen());
        case Routes.finddoctor:
        return MaterialPageRoute(builder: (_) => const FindDoctor());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No route defined"))),
        );
    }
  }
}
