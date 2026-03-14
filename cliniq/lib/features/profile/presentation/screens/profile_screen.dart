import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: AppColors.border),
              ),
            ),
            icon: const Icon(Icons.edit_rounded, color: AppColors.secondary, size: 20),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(context),
            const SizedBox(height: 40),
            _buildSection(
              context,
              title: "General",
              items: [
                _ProfileMenuItem(
                  icon: Icons.person_outline_rounded,
                  title: "Personal Information",
                  onTap: () {},
                ),
                _ProfileMenuItem(
                  icon: Icons.notifications_none_rounded,
                  title: "Notifications",
                  onTap: () {},
                ),
                _ProfileMenuItem(
                  icon: Icons.payment_rounded,
                  title: "Payment Methods",
                  onTap: () {},
                ),
              ],
            ),
            _buildSection(
              context,
              title: "Settings",
              items: [
                _ProfileMenuItem(
                  icon: Icons.lock_outline_rounded,
                  title: "Security",
                  onTap: () {},
                ),
                _ProfileMenuItem(
                  icon: Icons.language_rounded,
                  title: "Language",
                  trailing: "English",
                  onTap: () {},
                ),
                BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, themeMode) {
                    return _ProfileMenuItem(
                      icon: Icons.dark_mode_outlined,
                      title: "Dark Mode",
                      showToggle: true,
                      toggleValue: themeMode == ThemeMode.dark,
                      onToggleChanged: (val) {
                        context.read<ThemeCubit>().toggleTheme(val);
                      },
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
            _buildSection(
              context,
              title: "Support",
              items: [
                _ProfileMenuItem(
                  icon: Icons.help_outline_rounded,
                  title: "Help Center",
                  onTap: () {},
                ),
                _ProfileMenuItem(
                  icon: Icons.info_outline_rounded,
                  title: "About Cliniq",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.error,
                  backgroundColor: AppColors.error.withValues(alpha: 0.1),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout_rounded),
                    SizedBox(width: 10),
                    Text("Logout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.secondary, width: 2),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 16),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "Ansah Fred", 
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 4),
        Text(
          "ansahfred@example.com", 
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildSection(BuildContext context, {required String title, required List<Widget> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Text(
            title,
            style: AppText.titleSmall.copyWith(
              color: AppColors.textHint, 
              letterSpacing: 1,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        ...items,
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final bool showToggle;
  final bool toggleValue;
  final ValueChanged<bool>? onToggleChanged;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.showToggle = false,
    this.toggleValue = false,
    this.onToggleChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: isDark ? Border.all(color: Colors.white.withValues(alpha: 0.1)) : null,
        ),
        child: Icon(icon, color: AppColors.secondary, size: 22),
      ),
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontSize: 15, 
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: showToggle
          ? Switch.adaptive(
              value: toggleValue,
              onChanged: onToggleChanged,
              activeColor: AppColors.secondary,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (trailing != null)
                  Text(
                    trailing!,
                    style: AppText.subtitleSmall.copyWith(color: AppColors.textHint),
                  ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textHint),
              ],
            ),
    );
  }
}