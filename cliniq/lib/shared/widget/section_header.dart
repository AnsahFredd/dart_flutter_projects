import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.actionText = "See All",
    this.onActionPressed,
    this.showAction = true,
  });

  final String title;
  final String actionText;
  final VoidCallback? onActionPressed;
  final bool showAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          if (showAction)
            TextButton(
              onPressed: onActionPressed,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.secondary,
                textStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
              ),
              child: Text(actionText),
            ),
        ],
      ),
    );
  }
}
