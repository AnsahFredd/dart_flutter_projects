import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/shared/widget/custom_app_bar.dart';
import 'package:cliniq/features/notifications/domain/entities/notification.dart';
import 'package:cliniq/features/notifications/presentation/bloc/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String imageUrl;

  const ChatDetailScreen({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {"text": "Hello! How can I help you today?", "isMe": false, "time": "10:20 AM"},
    {"text": "I've been feeling a bit dizzy lately.", "isMe": true, "time": "10:21 AM"},
    {"text": "That's concerning. Have you been drinking enough water?", "isMe": false, "time": "10:22 AM"},
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        "text": _messageController.text,
        "isMe": true,
        "time": TimeOfDay.now().format(context),
      });
      _messageController.clear();
    });

    // Simulate mock response and notification
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      
      setState(() {
        _messages.add({
          "text": "Thank you for the information. I'll review and get back to you shortly.",
          "isMe": false,
          "time": TimeOfDay.now().format(context),
        });
      });

      context.read<NotificationCubit>().addNotification(
        NotificationEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: "New Message from ${widget.name}",
          message: "Thank you for the information. I'll review...",
          time: "Just now",
          icon: Icons.chat_bubble_rounded,
          color: AppColors.secondary,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.name,
        leftIconData: Icons.arrow_back_ios_new_rounded,
        onLeftPressed: () => Navigator.pop(context),
        rightWidget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.videoCall,
                arguments: {
                  "name": widget.name,
                  "image": widget.imageUrl,
                },
              ),
              icon: const Icon(Icons.videocam_rounded, color: AppColors.secondary, size: 22),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call_rounded, color: AppColors.secondary, size: 20),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              physics: const BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message["isMe"] as bool;

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isMe 
                          ? AppColors.secondary 
                          : (isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.surface2),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                        bottomLeft: Radius.circular(isMe ? 20 : 0),
                        bottomRight: Radius.circular(isMe ? 0 : 20),
                      ),
                      border: !isMe && isDark 
                          ? Border.all(color: Colors.white10) 
                          : null,
                    ),
                    child: Column(
                      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message["text"],
                          style: TextStyle(
                            color: isMe ? Colors.white : theme.textTheme.bodyMedium?.color,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message["time"],
                          style: TextStyle(
                            color: isMe ? Colors.white70 : AppColors.textHint,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Input Bar
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: isDark ? [] : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, -5),
                ),
              ],
              border: isDark ? const Border(top: BorderSide(color: Colors.white12)) : null,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_rounded, color: AppColors.secondary),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      filled: true,
                      fillColor: isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.surface,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: AppColors.border.withValues(alpha: 0.5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: AppColors.border.withValues(alpha: 0.5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.secondary.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
