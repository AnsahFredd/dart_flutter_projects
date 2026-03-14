import 'dart:convert';

import 'package:cliniq/core/constants/api_endpoints.dart';
import 'package:cliniq/features/auth/data/models/user_model.dart';
import 'package:cliniq/features/auth/domain/entities/user.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  
  Future<void> register(User user);
  Future<void> login(User user);
  Future<User> getCurrentUser();
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<void> register(User user) async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.register),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(({
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'phone': user.phone,
        'role': user.role.name,
      })),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to register an account. Try again.");
    }
  }

  @override
  Future<void> login(User user) async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': user.email, 'password': user.password}),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to login. Try again");
    }
  }

  @override
  Future<User> getCurrentUser() async {
    final response = await client.get(
      Uri.parse(ApiEndpoints.currentUser),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    }

    throw Exception("Unauthorized user");
  }

  @override
  Future<void> logout() async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.logout),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to log out. Try again");
    }
  }
}
