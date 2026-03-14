import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/search_doctors.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/filter_doctors.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/sort_doctors.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_specialty.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_city.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_state.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_zip_code.dart';
import 'package:cliniq/features/find_doctor/domain/usecases/get_doctors_by_country.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_event.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_state.dart';

class FindDoctorBloc extends Bloc<FindDoctorEvent, FindDoctorState> {
  final GetDoctors getDoctors;
  final SearchDoctors searchDoctors;
  final FilterDoctors filterDoctors;
  final SortDoctors sortDoctors;
  final GetDoctorsBySpecialty getDoctorsBySpecialty;
  final GetDoctorsByCity getDoctorsByCity;
  final GetDoctorsByState getDoctorsByState;
  final GetDoctorsByZipCode getDoctorsByZipCode;
  final GetDoctorsByCountry getDoctorsByCountry;

  FindDoctorBloc({
    required this.getDoctors,
    required this.searchDoctors,
    required this.filterDoctors,
    required this.sortDoctors,
    required this.getDoctorsBySpecialty,
    required this.getDoctorsByCity,
    required this.getDoctorsByState,
    required this.getDoctorsByZipCode,
    required this.getDoctorsByCountry,
  }) : super(FindDoctorInitial()) {
    on<GetDoctorsEvent>((event, emit) async {
      emit(FindDoctorLoading());
      try {
        final doctors = await getDoctors();
        emit(FindDoctorLoaded(doctors));
      } catch (e) {
        emit(FindDoctorError(e.toString()));
      }
    });

    on<SearchDoctorsEvent>((event, emit) async {
      emit(FindDoctorLoading());
      try {
        final doctors = await searchDoctors(event.query);
        emit(FindDoctorLoaded(doctors));
      } catch (e) {
        emit(FindDoctorError(e.toString()));
      }
    });

    on<FilterDoctorsEvent>((event, emit) async {
      emit(FindDoctorLoading());
      try {
        final doctors = await filterDoctors(event.query);
        emit(FindDoctorLoaded(doctors));
      } catch (e) {
        emit(FindDoctorError(e.toString()));
      }
    });

    on<SortDoctorsEvent>((event, emit) async {
      emit(FindDoctorLoading());
      try {
        final doctors = await sortDoctors(event.query);
        emit(FindDoctorLoaded(doctors));
      } catch (e) {
        emit(FindDoctorError(e.toString()));
      }
    });

    on<GetDoctorsBySpecialtyEvent>((event, emit) async {
      emit(FindDoctorLoading());
      try {
        final doctors = await getDoctorsBySpecialty(event.specialty);
        emit(FindDoctorLoaded(doctors));
      } catch (e) {
        emit(FindDoctorError(e.toString()));
      }
    });

    on<GetDoctorsByCityEvent>((event, emit) async {
      emit(FindDoctorLoading());
      try {
        final doctors = await getDoctorsByCity(event.city);
        emit(FindDoctorLoaded(doctors));
      } catch (e) {
        emit(FindDoctorError(e.toString()));
      }
    });

    on<GetDoctorsByStateEvent>((event, emit) async {
      emit(FindDoctorLoading());
      try {
        final doctors = await getDoctorsByState(event.state);
        emit(FindDoctorLoaded(doctors));
      } catch (e) {
        emit(FindDoctorError(e.toString()));
      }
    });

    on<GetDoctorsByZipCodeEvent>((event, emit) async {
      emit(FindDoctorLoading());
      try {
        final doctors = await getDoctorsByZipCode(event.zipCode);
        emit(FindDoctorLoaded(doctors));
      } catch (e) {
        emit(FindDoctorError(e.toString()));
      }
    });

    on<GetDoctorsByCountryEvent>((event, emit) async {
      emit(FindDoctorLoading());
      try {
        final doctors = await getDoctorsByCountry(event.country);
        emit(FindDoctorLoaded(doctors));
      } catch (e) {
        emit(FindDoctorError(e.toString()));
      }
    });
  }
}
