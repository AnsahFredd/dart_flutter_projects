import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leftIconData,
    this.rightIconData,
    this.leftIconColor,
    this.rightIconColor,
    this.onLeftPressed,
    this.onRightPressed,
  });

  final String title;

  // Use IconData for safety and reusability
  final IconData? leftIconData;
  final IconData? rightIconData;

  // Optional colors for icons
  final Color? leftIconColor;
  final Color? rightIconColor;

  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leading: leftIconData != null
          ? IconButton(
              onPressed: onLeftPressed ?? () {},
              icon: Icon(leftIconData, color: leftIconColor),
            )
          : null,

      // Title of the AppBar
      title: Text(title),
      centerTitle: true,
      elevation: 0,

      // Right-side icon (optional)
      actions: rightIconData != null
          ? [
              IconButton(
                onPressed: onRightPressed ?? () {},
                icon: Icon(rightIconData, color: rightIconColor),
              )
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}