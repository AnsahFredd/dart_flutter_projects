import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/shared/widget/custom_app_bar.dart';
import 'package:cliniq/shared/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_oldPasswordController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // Simulate success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password changed successfully!"),
        backgroundColor: AppColors.success,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Change Password",
        leftIconData: Icons.arrow_back_ios_new_rounded,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              "Your new password must be different from previous used passwords.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textHint,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: _oldPasswordController,
              label: "Current Password",
              hintText: "Enter current password",
              isPassword: _obscureOld,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureOld ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                  color: AppColors.textHint,
                  size: 20,
                ),
                onPressed: () => setState(() => _obscureOld = !_obscureOld),
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _newPasswordController,
              label: "New Password",
              hintText: "Enter new password",
              isPassword: _obscureNew,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureNew ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                  color: AppColors.textHint,
                  size: 20,
                ),
                onPressed: () => setState(() => _obscureNew = !_obscureNew),
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _confirmPasswordController,
              label: "Confirm New Password",
              hintText: "Confirm new password",
              isPassword: _obscureConfirm,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirm ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                  color: AppColors.textHint,
                  size: 20,
                ),
                onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Update Password",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
