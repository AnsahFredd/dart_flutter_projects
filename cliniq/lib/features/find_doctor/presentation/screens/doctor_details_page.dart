import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:cliniq/features/find_doctor/domain/entity/doctors.dart';
import 'package:flutter/material.dart';

class DoctorDetailsPage extends StatelessWidget {
  final Doctor doctor;
  
  const DoctorDetailsPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Custom App Bar with Image
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            stretch: true,
            backgroundColor: AppColors.secondary,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black26,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline_rounded, color: Colors.white, size: 22),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black26,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    doctor.profilePicture.isNotEmpty 
                        ? doctor.profilePicture 
                        : 'https://randomuser.me/api/portraits/lego/1.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black26,
                          Colors.transparent,
                          Colors.black45,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              transform: Matrix4.translationValues(0, -30, 0),
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Info Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.name,
                              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${doctor.role} • ${doctor.city}",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                            SizedBox(width: 4),
                            Text(
                              "4.8",
                              style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.secondary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatItem(context, "Patients", "1.2k+", Icons.people_rounded),
                      _buildStatItem(context, "Experience", "8 yrs", Icons.workspace_premium_rounded),
                      _buildStatItem(context, "Reviews", "480", Icons.star_outline_rounded),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // About Section
                  Text(
                    "About Doctor",
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Dr. ${doctor.name.split(' ').last} is a highly experienced ${doctor.role} in ${doctor.city}. She has been practicing for over 8 years and has helped thousands of patients recover from various conditions. She is known for her patient-centric approach and commitment to excellence in healthcare.",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark ? Colors.white70 : AppColors.textSecondary,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Working Hours
                  Text(
                    "Working Hours",
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 12),
                  _buildWorkingHourRow(context, "Mon - Fri", "09:00 AM - 05:00 PM"),
                  _buildWorkingHourRow(context, "Saturday", "10:00 AM - 02:00 PM"),

                  const SizedBox(height: 32),

                  // Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Patient Reviews",
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            "4.8  (480 reviews)",
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: isDark ? Colors.white60 : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildReviewItem(context, "Emma Johnson", "4.9", "Amazing doctor, very patient and thorough. Highly recommended!", "2d ago"),
                  _buildReviewItem(context, "James Carter", "4.6", "Professional and knowledgeable. The diagnosis was spot on.", "1w ago"),
                  _buildReviewItem(context, "Sarah Mitchell", "5.0", "Best doctor I've ever visited. Made me feel comfortable throughout.", "2w ago"),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(
            context,
            Routes.bookAppointment,
            arguments: Appointment(
              id: '',
              doctorName: doctor.name,
              speciality: doctor.role,
              hospital: doctor.city,
              image: doctor.profilePicture.isNotEmpty 
                  ? doctor.profilePicture 
                  : 'https://randomuser.me/api/portraits/lego/1.jpg',
              rating: '4.8',
              dateTime: DateTime.now(),
              status: AppointmentStatus.upcoming,
              type: AppointmentType.inPerson,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
          ),
          child: const Text(
            "Book Appointment",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value, IconData icon) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: (MediaQuery.of(context).size.width - 72) / 3,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.surface2,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isDark ? Colors.white10 : AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.secondary, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isDark ? Colors.white38 : AppColors.textHint,
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingHourRow(BuildContext context, String day, String hours) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white70 : AppColors.textSecondary,
            ),
          ),
          Text(
            hours,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(BuildContext context, String name, String rating, String review, String time) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final ratingValue = double.tryParse(rating) ?? 5.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.04) : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isDark ? Colors.white10 : AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                child: Text(
                  name[0],
                  style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
                    const SizedBox(height: 2),
                    Row(
                      children: List.generate(5, (i) => Icon(
                        i < ratingValue.floor() ? Icons.star_rounded : Icons.star_outline_rounded,
                        color: Colors.amber,
                        size: 14,
                      )),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isDark ? Colors.white38 : AppColors.textHint,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isDark ? Colors.white70 : AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
