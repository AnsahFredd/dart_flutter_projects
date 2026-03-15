import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/shared/widget/custom_search.dart';
import 'package:cliniq/shared/widget/loading_widget.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.finddoctor),
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: isDark ? Colors.white12 : AppColors.border),
              ),
            ),
            icon: const Icon(Icons.add_comment_rounded, color: AppColors.secondary, size: 20),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          CustomSearch(
            hintText: "Search messages...",
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              physics: BouncingScrollPhysics(),
              children: [
                _ChatItem(
                  name: "Dr. Sarah Wilson",
                  lastMessage: "The blood test results look normal. I'll see you next week!",
                  time: "10:24 AM",
                  unreadCount: 2,
                  imageUrl: "https://randomuser.me/api/portraits/women/45.jpg",
                  isOnline: true,
                ),
                _ChatItem(
                  name: "Dr. Michael Chen",
                  lastMessage: "Please remember to take your medication before sleep.",
                  time: "Yesterday",
                  imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                  isOnline: false,
                ),
                _ChatItem(
                  name: "MediCare Support",
                  lastMessage: "How can we help you today?",
                  time: "Dec 12",
                  imageUrl: "https://randomuser.me/api/portraits/lego/1.jpg",
                  isOnline: true,
                ),
                _ChatItem(
                  name: "Dr. James Lee",
                  lastMessage: "Your appointment has been confirmed.",
                  time: "Dec 10",
                  imageUrl: "https://randomuser.me/api/portraits/men/85.jpg",
                  isOnline: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  const _ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    required this.imageUrl,
    this.isOnline = false,
  });

  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String imageUrl;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isDark ? Colors.white.withValues(alpha: 0.1) : AppColors.border.withValues(alpha: 0.5)),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          Routes.chatDetail,
          arguments: {
            "name": name,
            "imageUrl": imageUrl,
          },
        ),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: isDark ? Colors.white10 : AppColors.border, width: 1),
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: isDark ? Colors.white10 : AppColors.surface2,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  ),
                  if (isOnline)
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        border: Border.all(color: theme.colorScheme.surface, width: 2),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Text(
                          time,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white38 : AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: unreadCount > 0 
                                  ? theme.textTheme.titleMedium?.color 
                                  : (isDark ? Colors.white38 : AppColors.textSecondary),
                              fontWeight: unreadCount > 0 ? FontWeight.w800 : FontWeight.w600,
                            ),
                          ),
                        ),
                        if (unreadCount > 0)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              unreadCount.toString(),
                              style: const TextStyle(
                                color: Colors.white, 
                                fontSize: 10, 
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}