import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  bool _isCalling = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _showSOSConfirmDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => _SOSCountdownDialog(
        onConfirm: () {
          Navigator.pop(ctx);
          setState(() => _isCalling = true);
          _showCallingSnackbar();
          Future.delayed(const Duration(seconds: 5), () {
            if (mounted) setState(() => _isCalling = false);
          });
        },
        onCancel: () => Navigator.pop(ctx),
      ),
    );
  }

  void _showCallingSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.local_hospital_rounded, color: Colors.white),
            SizedBox(width: 12),
            Text(
              "Calling emergency services...",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ],
        ),
        backgroundColor: AppColors.error,
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Emergency Help",
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppColors.error,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(child: _buildSOSButton()),
            const SizedBox(height: 40),
            _buildUrgentInfo(),
            const SizedBox(height: 30),
            _buildQuickServices(),
            const SizedBox(height: 30),
            _buildEmergencyContacts(theme, isDark),
            const SizedBox(height: 20),
            _buildMedicalProfile(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSOSButton() {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 220 + (40 * _pulseController.value),
              height: 220 + (40 * _pulseController.value),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.error.withValues(alpha: 0.2 - (0.2 * _pulseController.value)),
              ),
            ),
            Container(
              width: 180 + (30 * _pulseController.value),
              height: 180 + (30 * _pulseController.value),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.error.withValues(alpha: 0.3 - (0.3 * _pulseController.value)),
              ),
            ),
            GestureDetector(
              onLongPress: _showSOSConfirmDialog,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Hold for 1 second to call emergency services"),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isCalling ? AppColors.error.withValues(alpha: 0.7) : AppColors.error,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.error.withValues(alpha: 0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isCalling ? Icons.phone_in_talk_rounded : Icons.warning_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isCalling ? "CALLING" : "SOS",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUrgentInfo() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            "Press the SOS button for 3 seconds",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            "Help will be sent to your location immediately",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(color: isDark ? Colors.white38 : AppColors.textHint),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickServices() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _QuickServiceCard(icon: Icons.local_hospital_rounded, label: "Ambulance", color: Colors.red),
          _QuickServiceCard(icon: Icons.local_fire_department_rounded, label: "Fire Station", color: Colors.orange),
          _QuickServiceCard(icon: Icons.local_police_rounded, label: "Police", color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildEmergencyContacts(ThemeData theme, bool isDark) {
    final contacts = [
      {"name": "Dr. Sarah Smith", "relation": "Primary Doctor", "phone": "+1 555-0101"},
      {"name": "James Wilson", "relation": "Emergency Contact", "phone": "+1 555-0102"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Emergency Contacts",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          ...contacts.map((contact) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark ? Colors.white12 : AppColors.border.withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person_rounded, color: AppColors.error, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact["name"]!,
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        contact["relation"]!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDark ? Colors.white38 : AppColors.textHint,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone_rounded, color: AppColors.error),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.error.withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildMedicalProfile() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isDark ? Colors.white12 : AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.medical_information_rounded, color: AppColors.secondary),
              const SizedBox(width: 10),
              Text(
                "Medical ID",
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textHint),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              _MedicalTag(label: "Blood Type", value: "A+"),
              SizedBox(width: 12),
              _MedicalTag(label: "Weight", value: "72 kg"),
              SizedBox(width: 12),
              _MedicalTag(label: "Height", value: "180 cm"),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Allergies: Penicillin, Peanuts",
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SOSCountdownDialog extends StatefulWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const _SOSCountdownDialog({
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  State<_SOSCountdownDialog> createState() => _SOSCountdownDialogState();
}

class _SOSCountdownDialogState extends State<_SOSCountdownDialog> {
  int _countdown = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown <= 1) {
        timer.cancel();
        widget.onConfirm();
      } else {
        setState(() => _countdown--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      contentPadding: const EdgeInsets.all(28),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.error.withValues(alpha: 0.1),
            ),
            child: Center(
              child: Text(
                "$_countdown",
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Calling Emergency Services",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Emergency call will be made automatically. Tap cancel to abort.",
            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textHint),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                _timer?.cancel();
                widget.onCancel();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.error,
                side: const BorderSide(color: AppColors.error),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _QuickServiceCard({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _MedicalTag extends StatelessWidget {
  final String label;
  final String value;

  const _MedicalTag({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isDark ? Colors.white12 : AppColors.border.withValues(alpha: 0.5)),
        ),
        child: Column(
          children: [
            Text(
              label, 
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color: isDark ? Colors.white38 : AppColors.textHint,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value, 
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}