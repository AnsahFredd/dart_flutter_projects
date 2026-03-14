import 'package:cliniq/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    required super.phone,
    super.profilePicture,
    required super.role,
  });

  // defing the fromjson format
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      role: json['role'] == 'patient'
          ? UserRole.patient
          : json['role'] == 'doctor'
          ? UserRole.doctor
          : UserRole.admin,
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "role": role.name,
      "profilePicture": profilePicture,
    };
  }
}
