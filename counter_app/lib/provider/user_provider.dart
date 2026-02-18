import 'package:flutter/material.dart';

class UserProvider  extends ChangeNotifier{
  String username;

  UserProvider({
    this.username = "Fred",
  });

  void changeUserName({
    required String newUsername,
  }) async {
    username = newUsername;
    notifyListeners();
  }
}