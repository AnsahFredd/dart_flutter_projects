import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/shared/widget/custom_app_bar.dart';
import 'package:cliniq/shared/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _nameController = TextEditingController(text: "Ansah Fred");
  final _emailController = TextEditingController(text: "ansahfred@example.com");
  final _phoneController = TextEditingController(text: "+1 555-0199");
  final _addressController = TextEditingController(text: "123 Medical Drive, New York, NY");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Profile",
        leftIconData: Icons.arrow_back_ios_new_rounded,
        onLeftPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildAvatarSection(isDark),
            const SizedBox(height: 32),
            CustomTextField(
              controller: _nameController,
              label: "Full Name",
              hintText: "Enter your name",
              prefixIcon: Icons.person_rounded,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _emailController,
              label: "Email Address",
              hintText: "Enter your email",
              prefixIcon: Icons.email_rounded,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _phoneController,
              label: "Phone Number",
              hintText: "Enter your phone number",
              prefixIcon: Icons.phone_rounded,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _addressController,
              label: "Address",
              hintText: "Enter your address",
              prefixIcon: Icons.location_on_rounded,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Profile updated successfully!"),
                      backgroundColor: AppColors.success,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: const Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(bool isDark) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.secondary, width: 2),
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
