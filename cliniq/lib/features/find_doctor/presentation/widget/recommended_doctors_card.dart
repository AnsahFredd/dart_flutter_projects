import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/appointments/presentation/screens/appointments_list_page.dart';
import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecommendedDoctorsCard extends StatelessWidget {
  const RecommendedDoctorsCard({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isDark ? Colors.white10 : AppColors.border.withValues(alpha: 0.6)),
        boxShadow: isDark ? [] : [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AppointmentsListPage(
              doctorName: doctor.name,
              speciality: doctor.role,
              hospital: doctor.city,
              image: doctor.profilePicture.isNotEmpty
                  ? doctor.profilePicture
                  : 'https://randomuser.me/api/portraits/lego/1.jpg',
              rating: '4.8',
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: isDark ? [] : [
                        BoxShadow(
                          color: AppColors.secondary.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        doctor.profilePicture.isNotEmpty
                            ? doctor.profilePicture
                            : 'https://randomuser.me/api/portraits/lego/1.jpg',
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 75,
                          height: 75,
                          color: isDark ? Colors.white10 : AppColors.surface2,
                          child: const Icon(Icons.person, color: AppColors.textHint),
                        ),
                      ),
                    ),
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
                                doctor.name,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const Icon(Icons.favorite_outline_rounded, 
                              color: AppColors.textHint, 
                              size: 20
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${doctor.role} • ${doctor.city}',
                          style: theme.textTheme.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              '4.8',
                              style: theme.textTheme.titleSmall?.copyWith(fontSize: 13, fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(120 reviews)',
                              style: AppText.subtitleSmall.copyWith(fontSize: 11, color: AppColors.textHint),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Divider(height: 1, color: theme.dividerColor),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.calendar_today_rounded,
                      size: 14,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Next: ${DateFormat('EEE, h:mm a').format(doctor.updatedAt)}",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "Available",
                      style: AppText.subtitleSmall.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w800,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

