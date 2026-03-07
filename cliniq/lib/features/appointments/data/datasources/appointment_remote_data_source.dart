import 'dart:convert';
import 'package:cliniq/core/constants/api_endpoints.dart';
import 'package:cliniq/features/appointments/data/models/appointment_model.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:http/http.dart' as http;

abstract class AppointmentRemoteDataSource {
  Future<void> bookAppointment(Appointment appointment);
  Future<List<AppointmentModel>> getUpcomingAppointments();
  Future<void> cancelAppointment(String id);
  Future<AppointmentModel> getAppointmentById(String id);
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  final http.Client client;

  AppointmentRemoteDataSourceImpl(this.client);

  @override
  Future<void> bookAppointment(Appointment appointment) async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.bookAppointment),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode((appointment as AppointmentModel).toJson()),
    );
    if(response.statusCode != 201) {
      throw Exception("Failed to book appointment");
    }
  }

  @override
  Future<List<AppointmentModel>> getUpcomingAppointments() async {
    final response = await client.get(
      Uri.parse(ApiEndpoints.getAppointments),
      headers: {'Content-Type': 'application/json'},
    );
    if(response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => AppointmentModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch appointments");
    }
  }

  @override
  Future<void> cancelAppointment(String id) async {
    final response = await client.delete(
      Uri.parse('${ApiEndpoints.cancelAppointment}/$id'),
      headers: { 'Content-Type': 'application/json'},
    );
    if(response.statusCode != 200) {
      throw Exception("Failed to cancel appointment");
    }
  }

  @override
  Future<AppointmentModel> getAppointmentById(String id) async {
    final response = await client.get(
      Uri.parse(
        "${ApiEndpoints.getAppointments}/$id",
      ),
      headers: {'Content-Type': 'application/json'},
    );
    if(response.statusCode == 200) {
      return AppointmentModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch appointment");
    }
  }
}