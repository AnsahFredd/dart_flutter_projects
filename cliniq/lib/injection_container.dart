import 'package:cliniq/features/appointments/data/repositories/appointment_repository_impl.dart';
import 'package:cliniq/features/appointments/domain/usecases/book_new_appointment.dart';
import 'package:cliniq/features/appointments/domain/usecases/cancel_appointment.dart';
import 'package:cliniq/features/appointments/domain/usecases/get_appointment_details.dart';
import 'package:cliniq/features/appointments/domain/usecases/get_upcoming_appointments.dart';
import 'package:cliniq/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:cliniq/features/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:cliniq/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cliniq/features/auth/domain/usecases/get_current_user.dart';
import 'package:cliniq/features/auth/domain/usecases/login.dart';
import 'package:cliniq/features/auth/domain/usecases/logout.dart';
import 'package:cliniq/features/auth/domain/usecases/register.dart';
import 'package:cliniq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cliniq/features/appointments/data/datasources/appointment_firebase_data_source.dart';

// find doctor imports
import 'package:cliniq/features/find_doctor/data/datasources/doctor_firebase_data_source.dart';
import 'package:cliniq/features/find_doctor/data/repositories/doctor_repository_impl.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/search_doctors.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/filter_doctors.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/sort_doctors.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_specialty.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_city.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_state.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_zip_code.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_country.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_bloc.dart';
// auth
final _authDataSource = AuthFirebaseDataSource();
final _authRepository = AuthRepositoryImpl(_authDataSource);

AuthBloc buildAuthBloc() => AuthBloc(
  login: Login(_authRepository),
  register: Register(_authRepository),
  logout: Logout(_authRepository),
  getCurrentUser: GetCurrentUser(_authRepository),
);

// appointments
final _appointmentRepository = AppointmentRepositoryImpl(AppointmentFirebaseDataSource());


AppointmentBloc buildAppointmentBloc() => AppointmentBloc(
  bookNewAppointment: BookNewAppointment(_appointmentRepository),
  getUpcomingAppointments: GetUpcomingAppointments(_appointmentRepository),
  cancelAppointment: CancelAppointment(_appointmentRepository),
  getAppointmentDetails: GetAppointmentDetails(_appointmentRepository),
);

// find_doctor
final _doctorRepository = DoctorRepositoryImpl(DoctorFirebaseDataSource());

FindDoctorBloc buildFindDoctorBloc() => FindDoctorBloc(
  getDoctors: GetDoctors(_doctorRepository),
  searchDoctors: SearchDoctors(_doctorRepository),
  filterDoctors: FilterDoctors(_doctorRepository),
  sortDoctors: SortDoctors(_doctorRepository),
  getDoctorsBySpecialty: GetDoctorsBySpecialty(_doctorRepository),
  getDoctorsByCity: GetDoctorsByCity(_doctorRepository),
  getDoctorsByState: GetDoctorsByState(_doctorRepository),
  getDoctorsByZipCode: GetDoctorsByZipCode(_doctorRepository),
  getDoctorsByCountry: GetDoctorsByCountry(_doctorRepository),
);
