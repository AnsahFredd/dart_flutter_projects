import 'package:cliniq/features/auth/data/models/user_model.dart';
import 'package:cliniq/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cliniq/features/auth/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthFirebaseDataSource implements AuthRemoteDataSource {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> register(User user) async {
    final result = await _auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
    final uid = result.user!.uid;

    await _firestore.collection('users').doc(uid).set({
      'id': uid,
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'role': user.role.name,
      'prfilePicture': user.profilePicture,
    });
    
  }

  @override
  Future<void> login(User user) async {
    await _auth.signInWithEmailAndPassword(email: user.email, password: user.password);

  }

  @override
  Future<User> getCurrentUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) throw Exception("Unauthorized user");

    final doc = await _firestore.collection('users').doc(firebaseUser.uid).get();

    if (!doc.exists) throw Exception("User not found");

    return UserModel.fromJson(doc.data()!);
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}