enum ReportType { lab, prescription, imaging, vaccine }

class MedicalReport {
  final String id;
  final String title;
  final String doctorName;
  final DateTime date;
  final ReportType type;
  final String? fileUrl;

  const MedicalReport({
    required this.id,
    required this.title,
    required this.doctorName,
    required this.date,
    required this.type,
    this.fileUrl,
  });
}