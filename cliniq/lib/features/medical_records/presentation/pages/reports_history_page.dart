import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/features/medical_records/domain/entities/report.dart';
import 'package:cliniq/features/medical_records/presentation/bloc/medical_record_cubit.dart';
import 'package:cliniq/shared/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReportsHistoryPage extends StatefulWidget {
  const ReportsHistoryPage({super.key});

  @override
  State<ReportsHistoryPage> createState() => _ReportsHistoryPageState();
}

class _ReportsHistoryPageState extends State<ReportsHistoryPage> {
  ReportType? selectedType;
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocBuilder<MedicalRecordCubit, MedicalRecordState>(
      builder: (context, state) {
        final filteredReports = state.reports.where((r) {
          final matchesType = selectedType == null || r.type == selectedType;
          final matchesSearch = r.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              r.doctorName.toLowerCase().contains(searchQuery.toLowerCase());
          return matchesType && matchesSearch;
        }).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text("Medical Records"),
            actions: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, Routes.addMedicalRecord),
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.surface,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: isDark ? Colors.white12 : AppColors.border),
                  ),
                ),
                icon: const Icon(Icons.add_circle_outline_rounded, color: AppColors.secondary, size: 20),
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 8),
              CustomSearch(
                hintText: "Search reports...",
                onChanged: (val) => setState(() => searchQuery = val),
              ),
              const SizedBox(height: 24),
              _buildCategoryFilter(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  physics: const BouncingScrollPhysics(),
                  itemCount: filteredReports.length,
                  itemBuilder: (context, index) {
                    return _ReportCard(report: filteredReports[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          _FilterChip(
            label: "All",
            isSelected: selectedType == null,
            onTap: () => setState(() => selectedType = null),
          ),
          ...ReportType.values.map((type) => _FilterChip(
                label: type.name[0].toUpperCase() + type.name.substring(1),
                isSelected: selectedType == type,
                onTap: () => setState(() => selectedType = type),
              )),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? AppColors.primary : (isDark ? Colors.white12 : AppColors.border),
              width: 1.5,
            ),
            boxShadow: isSelected && !isDark
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Text(
            label,
            style: theme.textTheme.titleSmall?.copyWith(
              color: isSelected ? Colors.white : (isDark ? Colors.white38 : AppColors.textSecondary),
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final MedicalReport report;

  const _ReportCard({required this.report});

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

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isDark ? Colors.white12 : AppColors.border.withValues(alpha: 0.5)),
        boxShadow: isDark ? [] : [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context, 
          Routes.medicalRecordDetails,
          arguments: report,
        ),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      report.doctorName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('MMM dd, yyyy').format(report.date),
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 11, 
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white38 : AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (val) {
                  if (val == 'delete') {
                    context.read<MedicalRecordCubit>().deleteReport(report.id);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'view',
                    child: Row(
                      children: [
                        Icon(Icons.visibility_rounded, size: 20),
                        SizedBox(width: 8),
                        Text("View Report", style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'download',
                    child: Row(
                      children: [
                        Icon(Icons.file_download_rounded, size: 20),
                        SizedBox(width: 8),
                        Text("Download PDF", style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline_rounded, color: AppColors.error, size: 20),
                        SizedBox(width: 8),
                        Text("Delete", style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}