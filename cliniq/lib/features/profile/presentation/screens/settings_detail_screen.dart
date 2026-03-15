import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/shared/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsDetailScreen extends StatefulWidget {
  final String title;

  const SettingsDetailScreen({
    super.key,
    required this.title,
  });

  @override
  State<SettingsDetailScreen> createState() => _SettingsDetailScreenState();
}

class _SettingsDetailScreenState extends State<SettingsDetailScreen> {
  String _selectedLanguage = "English";
  bool _twoFactorEnabled = false;
  bool _biometricEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        leftIconData: Icons.arrow_back_ios_new_rounded,
        onLeftPressed: () => Navigator.pop(context),
      ),
      body: _buildContent(context, isDark, theme),
    );
  }

  Widget _buildContent(BuildContext context, bool isDark, ThemeData theme) {
    switch (widget.title) {
      case "Security":
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _buildSettingTile(
              context, 
              "Change Password", 
              Icons.lock_reset_rounded,
              onTap: () {
                Navigator.pushNamed(context, Routes.changePassword);
              },
            ),
            _buildSettingTile(
              context, 
              "Two-Factor Authentication", 
              Icons.verified_user_rounded, 
              showSwitch: true,
              value: _twoFactorEnabled,
              onChanged: (val) => setState(() => _twoFactorEnabled = val),
            ),
            _buildSettingTile(
              context, 
              "Biometric Login", 
              Icons.fingerprint_rounded, 
              showSwitch: true, 
              value: _biometricEnabled,
              onChanged: (val) => setState(() => _biometricEnabled = val),
            ),
            _buildSettingTile(context, "Privacy Policy", Icons.privacy_tip_rounded),
          ],
        );
      case "Language":
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _buildLanguageTile(context, "English", "US", _selectedLanguage == "English"),
            _buildLanguageTile(context, "Spanish", "ES", _selectedLanguage == "Spanish"),
            _buildLanguageTile(context, "French", "FR", _selectedLanguage == "French"),
            _buildLanguageTile(context, "German", "DE", _selectedLanguage == "German"),
          ],
        );
      case "Help Center":
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _buildSettingTile(context, "FAQ", Icons.quiz_rounded),
            _buildSettingTile(context, "Contact Support", Icons.headset_mic_rounded),
            _buildSettingTile(context, "Report a Bug", Icons.bug_report_rounded),
            _buildSettingTile(context, "Terms of Service", Icons.description_rounded),
          ],
        );
      case "About Cliniq":
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.favorite_rounded, color: AppColors.secondary, size: 48),
              ),
              const SizedBox(height: 24),
              Text("Cliniq v1.0.0", style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
              const SizedBox(height: 12),
              Text(
                "Your all-in-one healthcare companion. Built with love to provide you with the best medical care and management.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textHint, height: 1.5),
              ),
              const Spacer(),
              const Text("Made with ❤️ by Cliniq Team", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
              const SizedBox(height: 20),
            ],
          ),
        );
      default:
        return const Center(child: Text("Coming Soon"));
    }
  }

  Widget _buildSettingTile(
    BuildContext context, 
    String title, 
    IconData icon, 
    {bool showSwitch = false, bool value = false, ValueChanged<bool>? onChanged, VoidCallback? onTap}
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.surface2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.secondary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
        trailing: showSwitch 
          ? Switch.adaptive(value: value, onChanged: onChanged, activeColor: AppColors.secondary)
          : const Icon(Icons.arrow_forward_ios_rounded, size: 14),
        onTap: onTap ?? () {},
      ),
    );
  }

  Widget _buildLanguageTile(BuildContext context, String name, String code, bool isSelected) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.surface2,
        borderRadius: BorderRadius.circular(16),
        border: isSelected ? Border.all(color: AppColors.secondary, width: 1.5) : null,
      ),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
        trailing: isSelected ? const Icon(Icons.check_circle_rounded, color: AppColors.secondary) : null,
        onTap: () {
          setState(() {
            _selectedLanguage = name;
          });
        },
      ),
    );
  }
}
