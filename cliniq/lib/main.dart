import 'package:cliniq/core/routing/app_router.dart';
import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_theme.dart';
import 'package:cliniq/core/theme/theme_cubit.dart';
import 'package:cliniq/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:cliniq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_bloc.dart';
import 'package:cliniq/features/medical_records/presentation/bloc/medical_record_cubit.dart';
import 'package:cliniq/features/notifications/presentation/bloc/notification_cubit.dart';
import 'package:cliniq/features/payments/presentation/bloc/payments_cubit.dart';
import 'package:cliniq/firebase_options.dart';
import 'package:cliniq/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppointmentBloc>(create: (_) => buildAppointmentBloc()),
        BlocProvider<AuthBloc>(create: (_) => buildAuthBloc()),
        BlocProvider<FindDoctorBloc>(create: (_) => buildFindDoctorBloc()),
        BlocProvider<MedicalRecordCubit>(create: (_) => MedicalRecordCubit()),
        BlocProvider<NotificationCubit>(create: (_) => NotificationCubit()),
        BlocProvider<PaymentsCubit>(create: (_) => PaymentsCubit()),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            onGenerateRoute: AppRouter().generateRoute,
            initialRoute: Routes.slashScreen,
          );
        },
      ),
    );
  }
}