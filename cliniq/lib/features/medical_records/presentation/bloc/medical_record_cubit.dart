import 'package:cliniq/features/medical_records/domain/entities/report.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalRecordState {
  final List<MedicalReport> reports;
  final bool isLoading;

  MedicalRecordState({required this.reports, this.isLoading = false});
}

class MedicalRecordCubit extends Cubit<MedicalRecordState> {
  MedicalRecordCubit() : super(MedicalRecordState(reports: [
    MedicalReport(
      id: '1',
      title: 'Blood Analysis',
      doctorName: 'Dr. Michael Chen',
      date: DateTime.now().subtract(const Duration(days: 2)),
      type: ReportType.lab,
    ),
    MedicalReport(
      id: '2',
      title: 'Chest X-Ray',
      doctorName: 'Dr. Sarah Wilson',
      date: DateTime.now().subtract(const Duration(days: 5)),
      type: ReportType.imaging,
    ),
  ]));

  void addReport(MedicalReport report) {
    emit(MedicalRecordState(reports: [report, ...state.reports]));
  }

  void deleteReport(String id) {
    final newList = state.reports.where((r) => r.id != id).toList();
    emit(MedicalRecordState(reports: newList));
  }
}
