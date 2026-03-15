import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leftIconData,
    this.rightWidget,
    this.leftIconColor,
    this.onLeftPressed,
  });

  final String title;
  final IconData? leftIconData;
  final Widget? rightWidget;
  final Color? leftIconColor;
  final VoidCallback? onLeftPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: leftIconData != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: onLeftPressed ?? () => Navigator.pop(context),
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: isDark ? Colors.white12 : AppColors.border),
                  ),
                ),
                icon: Icon(
                  leftIconData, 
                  color: leftIconColor ?? theme.colorScheme.onSurface,
                  size: 18,
                ),
              ),
            )
          : null,
      title: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
      ),
      centerTitle: true,
      actions: [
        if (rightWidget != null) rightWidget!,
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}