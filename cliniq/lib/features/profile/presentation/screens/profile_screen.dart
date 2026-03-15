import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/core/theme/theme_cubit.dart';
import 'package:cliniq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cliniq/features/auth/presentation/bloc/auth_event.dart';
import 'package:cliniq/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.editProfile),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: isDark ? Colors.white12 : AppColors.border),
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
                  onTap: () => Navigator.pushNamed(context, Routes.editProfile),
                ),
                _ProfileMenuItem(
                  icon: Icons.history_edu_rounded,
                  title: "Medical Profile",
                  onTap: () => Navigator.pushNamed(context, Routes.medicalProfile),
                ),
                _ProfileMenuItem(
                  icon: Icons.notifications_none_rounded,
                  title: "Notifications",
                  onTap: () => Navigator.pushNamed(context, Routes.notifications),
                ),
                _ProfileMenuItem(
                  icon: Icons.payment_rounded,
                  title: "Payment Methods",
                  onTap: () => Navigator.pushNamed(context, Routes.payments),
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
                  onTap: () => Navigator.pushNamed(context, Routes.security),
                ),
                _ProfileMenuItem(
                  icon: Icons.language_rounded,
                  title: "Language",
                  trailing: "English",
                  onTap: () => Navigator.pushNamed(context, Routes.language),
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
                  onTap: () => Navigator.pushNamed(context, Routes.help),
                ),
                _ProfileMenuItem(
                  icon: Icons.info_outline_rounded,
                  title: "About Cliniq",
                  onTap: () => Navigator.pushNamed(context, Routes.about),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedOut) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.login,
                      (route) => false,
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.error.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () => context.read<AuthBloc>().add(LogoutEvent()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? AppColors.error.withValues(alpha: 0.1) : const Color(0xFFFFEBEE),
                      foregroundColor: AppColors.error,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: AppColors.error.withValues(alpha: 0.2)),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout_rounded, size: 20),
                        SizedBox(width: 12),
                        Text(
                          "Log Out", 
                          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.secondary.withValues(alpha: 0.3), width: 2),
                ),
                child: const CircleAvatar(
                  radius: 54,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.colorScheme.surface, width: 3),
                ),
                child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Ansah Fred", 
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.5),
          ),
          const SizedBox(height: 6),
          Text(
            "ansahfred@example.com", 
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textHint,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
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
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white38 : AppColors.textHint, 
              letterSpacing: 1,
              fontWeight: FontWeight.w900,
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
          color: AppColors.secondary.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
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
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark ? Colors.white38 : AppColors.textHint,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios_rounded, 
                  size: 14, 
                  color: isDark ? Colors.white24 : AppColors.textHint
                ),
              ],
            ),
    );
  }
}