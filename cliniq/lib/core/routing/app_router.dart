import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:cliniq/features/appointments/presentation/screens/appointment_page.dart';
import 'package:cliniq/features/appointments/presentation/screens/appointments_list_page.dart';
import 'package:cliniq/features/appointments/presentation/screens/booking_success_page.dart';
import 'package:cliniq/features/appointments/presentation/screens/video_call_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/login_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/register_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/change_password_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:cliniq/features/auth/presentation/screens/verification_screen.dart';
import 'package:cliniq/features/emergency/presentation/screens/emergency_screen.dart';
import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:cliniq/features/find_doctor/presentation/screens/doctor_details_page.dart';
import 'package:cliniq/features/find_doctor/presentation/screens/find_doctor.dart';
import 'package:cliniq/features/medical_records/presentation/pages/add_medical_record_page.dart';
import 'package:cliniq/features/medical_records/presentation/pages/report_details_page.dart';
import 'package:cliniq/features/medical_records/presentation/pages/reports_history_page.dart';
import 'package:cliniq/features/messages/presentation/screens/chat_detail_screen.dart';
import 'package:cliniq/features/messages/presentation/screens/messages_screen.dart';
import 'package:cliniq/features/notifications/presentation/pages/notifications_page.dart';
import 'package:cliniq/features/payments/presentation/screens/payments_page.dart';
import 'package:cliniq/features/onboarding/screens/onboarding_screen.dart';
import 'package:cliniq/features/profile/presentation/screens/edit_profile_page.dart';
import 'package:cliniq/features/profile/presentation/screens/medical_profile_page.dart';
import 'package:cliniq/features/profile/presentation/screens/profile_screen.dart';
import 'package:cliniq/features/profile/presentation/screens/settings_detail_screen.dart';
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
        return MaterialPageRoute(builder: (_) => const AppointmentPage());
      case Routes.bookAppointment:
        final args = settings.arguments as Appointment;
        return MaterialPageRoute(
          builder: (_) => AppointmentsListPage(
            doctorName: args.doctorName,
            speciality: args.speciality,
            hospital: args.hospital,
            image: args.image,
            rating: args.rating,
            existingAppointment: args,
          ),
        );
      case Routes.bookingSuccess:
        final args = settings.arguments as Appointment;
        return MaterialPageRoute(builder: (_) => BookingSuccessPage(appointment: args));
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.medicalProfile:
        return MaterialPageRoute(builder: (_) => const MedicalProfilePage());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfilePage());
      case Routes.medicalrecords:
        return MaterialPageRoute(builder: (_) => const ReportsHistoryPage());
      case Routes.addMedicalRecord:
        return MaterialPageRoute(builder: (_) => const AddMedicalRecordPage());
      case Routes.medicalRecordDetails:
        final args = settings.arguments as MedicalReport;
        return MaterialPageRoute(builder: (_) => ReportDetailsPage(report: args));
      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsPage());
      case Routes.payments:
        return MaterialPageRoute(builder: (_) => const PaymentsPage());
      case Routes.messages:
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case Routes.chatDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ChatDetailScreen(
            name: args['name'],
            imageUrl: args['imageUrl'],
          ),
        );
      case Routes.emergency:
        return MaterialPageRoute(builder: (_) => const EmergencyScreen());
      case Routes.videoCall:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => VideoCallScreen(
            doctorName: args['name'],
            doctorImage: args['image'],
          ),
        );
      case Routes.finddoctor:
        return MaterialPageRoute(builder: (_) => const FindDoctor());
      case Routes.doctorDetails:
        final args = settings.arguments as Doctor;
        return MaterialPageRoute(builder: (_) => DoctorDetailsPage(doctor: args));
      case Routes.security:
        return MaterialPageRoute(builder: (_) => const SettingsDetailScreen(title: "Security"));
      case Routes.language:
        return MaterialPageRoute(builder: (_) => const SettingsDetailScreen(title: "Language"));
      case Routes.help:
        return MaterialPageRoute(builder: (_) => const SettingsDetailScreen(title: "Help Center"));
      case Routes.about:
        return MaterialPageRoute(builder: (_) => const SettingsDetailScreen(title: "About Cliniq"));
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No route defined"))),
        );
    }
  }
}
