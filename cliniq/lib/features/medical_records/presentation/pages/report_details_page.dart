import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/features/medical_records/domain/entities/report.dart';
import 'package:cliniq/shared/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportDetailsPage extends StatelessWidget {
  final MedicalReport report;

  const ReportDetailsPage({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    IconData icon;
    Color color;

    switch (report.type) {
      case ReportType.lab:
        icon = Icons.biotech_rounded;
        color = Colors.blue;
        break;
      case ReportType.prescription:
        icon = Icons.medication_rounded;
        color = Colors.orange;
        break;
      case ReportType.imaging:
        icon = Icons.visibility_rounded;
        color = Colors.purple;
        break;
      case ReportType.vaccine:
        icon = Icons.vaccines_rounded;
        color = Colors.green;
        break;
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: "Report Details",
        leftIconData: Icons.arrow_back_ios_new_rounded,
        onLeftPressed: () => Navigator.pop(context),
        rightWidget: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Sharing report...")),
            );
          },
          icon: const Icon(Icons.share_rounded, color: AppColors.secondary, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: isDark ? Colors.white12 : AppColors.border.withValues(alpha: 0.5)),
                boxShadow: isDark ? [] : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(icon, color: color, size: 36),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          report.title,
                          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          report.type.name[0].toUpperCase() + report.type.name.substring(1),
                          style: theme.textTheme.bodyMedium?.copyWith(color: color, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            _buildInfoRow(context, "Doctor", report.doctorName, Icons.person_rounded),
            const SizedBox(height: 20),
            _buildInfoRow(context, "Date", DateFormat('MMMM dd, yyyy').format(report.date), Icons.calendar_month_rounded),
            const SizedBox(height: 20),
            _buildInfoRow(context, "ID", report.id, Icons.tag_rounded),
            
            const SizedBox(height: 40),
            
            Text(
              "Report Document",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? Colors.white.withValues(alpha: 0.05) : AppColors.surface2,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isDark ? Colors.white12 : AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf_rounded, color: AppColors.error, size: 32),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MedicalReport_v1.pdf", style: TextStyle(fontWeight: FontWeight.w800)),
                        SizedBox(height: 2),
                        Text("2.4 MB", style: TextStyle(color: AppColors.textHint, fontSize: 12, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Downloading PDF...")),
                      );
                    },
                    icon: const Icon(Icons.file_download_rounded, color: AppColors.secondary),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Discussion / Message Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Messages",
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                ),
                TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Message feature coming soon!")),
                    );
                  },
                  icon: const Icon(Icons.add_comment_rounded, size: 18),
                  label: const Text("Add Message", style: TextStyle(fontWeight: FontWeight.bold)),
                  style: TextButton.styleFrom(foregroundColor: AppColors.secondary),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? Colors.white.withValues(alpha: 0.02) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isDark ? Colors.white12 : AppColors.border.withValues(alpha: 0.5)),
              ),
              child: const Center(
                child: Text(
                  "No messages or notes added to this report yet.",
                  style: TextStyle(color: AppColors.textHint, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, IconData icon) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.secondary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.secondary, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColors.textHint, fontSize: 12, fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(value, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
          ],
        ),
      ],
    );
  }
}
