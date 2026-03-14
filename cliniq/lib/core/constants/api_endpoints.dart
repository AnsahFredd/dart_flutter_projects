class ApiEndpoints {

  static const  String baseUrl = "http://localhost:4000";


  // ─── AUTH ───────────────────────────────────────────
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  static const String logout = "$baseUrl/auth/logout";
  static const String currentUser = "$baseUrl/auth/me";
  static const String resetPassword = "$baseUrl/auth/reset-passwrod";
  static const String forgotPassword = "$baseUrl/auth/forgot-password";


  // ─── PATIENT ─────────────────────────────────────────
  static const String patientProfile = "$baseUrl/patients/profile";
  static const String updateProfile = "$baseUrl/patients/update";
  static const String patientDashboard = "$baseUrl/patients/dashboard";


  // ─── DOCTORS ─────────────────────────────────────────
  static const String getAllDoctors = "$baseUrl/doctors";
  static const String searchDoctors = "$baseUrl/doctors/search";
  static const String getDoctorById = "$baseUrl/doctors";
  static const String getDoctorsBySpec = "$baseUrl/doctors/speciality";


  // ─── APPOINTMENTS ────────────────────────────────────
  static const String bookAppointment      = "$baseUrl/appointments/book";
  static const String getAppointments      = "$baseUrl/appointments";
  static const String cancelAppointment    = "$baseUrl/appointments/cancel"; // + "/{id}"
  static const String rescheduleAppointment= "$baseUrl/appointments/reschedule"; // + "/{id}"
  static const String upcomingAppointments = "$baseUrl/appointments/upcoming";


  // ─── MEDICAL RECORDS ─────────────────────────────────
  static const String getMedicalRecords  = "$baseUrl/records";
  static const String getLabResults      = "$baseUrl/records/lab-results";
  static const String getPrescriptions   = "$baseUrl/records/prescriptions";
  static const String getXRays           = "$baseUrl/records/xrays";


  // ─── NOTIFICATIONS ───────────────────────────────────
  static const String getNotifications   = "$baseUrl/notifications";
  static const String markAllRead        = "$baseUrl/notifications/mark-all-read";
  static const String markOneRead        = "$baseUrl/notifications/mark-read"; // + "/{id}"

  // ─── SETTINGS ────────────────────────────────────────
  static const String getSettings        = "$baseUrl/settings";
  static const String updateLanguage     = "$baseUrl/settings/language";
  static const String updateNotifPref    = "$baseUrl/settings/notifications";
  static const String getInsuranceDetails= "$baseUrl/settings/insurance";

  static const String emergency = "$baseUrl/emergency/alert";
}