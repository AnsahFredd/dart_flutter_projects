import 'package:counter_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _controller = TextEditingController();
  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text('Username: ${context.read<UserProvider>().username}', style: TextStyle(
                  fontSize: 24,
                  
                ),),
              ),
              SizedBox(height: 40.0,),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
              ),
              SizedBox(height: 30.0,),
              ElevatedButton(onPressed: () {
                context.read<UserProvider>().changeUserName(newUsername: _controller.text);
              }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );

  }
}