import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _controller = TextEditingController();
  double sliderValue = 0.0;
  bool isChecked = false;
  String? menuItem;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),

              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),

              const SizedBox(height: 80),

              Slider.adaptive(
                value: sliderValue,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),

              DropdownButton<String>(
                value: menuItem,
                hint: const Text("Select option"),
                items: const [
                  DropdownMenuItem(value: "Option 1", child: Text("Option 1")),
                  DropdownMenuItem(value: "Option 2", child: Text("Option 2")),
                ],
                onChanged: (value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(    
                    context,
                  ).showSnackBar(SnackBar(
                    content: Text("Snack bar"),
                    duration: Duration(seconds: 3),
                    behavior: SnackBarBehavior.floating,
                    ),
                    
                  );
                },
                child: Text("Open snack bar"),
              ),
              Divider(
                color: Colors.teal,
                thickness: 2.0,
                endIndent: 200.0,
              ),
              ElevatedButton
              (onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: Text("Alert content"),
                    title: Text("Alet title"),
                    actions: [
                      FilledButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text("Close"))
                    ],
                  );
                });
              }, 
              child: Text("Open dialog")),
              TextButton(onPressed: () {}, child: Text("Click me")),
              OutlinedButton(onPressed: () {}, child: Text("Click me")),
            ],
          ),
        ),
      ),
    );
  }
}
