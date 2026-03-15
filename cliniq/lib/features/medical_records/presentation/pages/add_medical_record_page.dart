import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/features/medical_records/domain/entities/report.dart';
import 'package:cliniq/features/medical_records/presentation/bloc/medical_record_cubit.dart';
import 'package:cliniq/shared/widget/custom_app_bar.dart';
import 'package:cliniq/shared/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddMedicalRecordPage extends StatefulWidget {
  const AddMedicalRecordPage({super.key});

  @override
  State<AddMedicalRecordPage> createState() => _AddMedicalRecordPageState();
}

class _AddMedicalRecordPageState extends State<AddMedicalRecordPage> {
  final _titleController = TextEditingController();
  final _doctorController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  ReportType _selectedType = ReportType.lab;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Medical Record",
        leftIconData: Icons.arrow_back_ios_new_rounded,
        onLeftPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(theme, "Report Details"),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _titleController,
              hintText: "e.g., Annual Checkup",
              label: "Report Title",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _doctorController,
              hintText: "e.g., Dr. Sarah Smith",
              label: "Doctor Name",
            ),
            const SizedBox(height: 24),
            _buildSectionHeader(theme, "Category"),
            const SizedBox(height: 16),
            _buildCategoryGrid(),
            const SizedBox(height: 24),
            _buildSectionHeader(theme, "Date"),
            const SizedBox(height: 16),
            _buildDatePicker(theme, isDark),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: const Text("Upload Report"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.5,
      ),
      itemCount: ReportType.values.length,
      itemBuilder: (context, index) {
        final type = ReportType.values[index];
        final isSelected = _selectedType == type;
        return GestureDetector(
          onTap: () => setState(() => _selectedType = type),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
                width: 1.5,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              type.name[0].toUpperCase() + type.name.substring(1),
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDatePicker(ThemeData theme, bool isDark) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        if (picked != null) setState(() => _selectedDate = picked);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month_rounded, color: AppColors.secondary),
            const SizedBox(width: 12),
            Text(
              DateFormat('MMMM dd, yyyy').format(_selectedDate),
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const Icon(Icons.arrow_drop_down_rounded),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_titleController.text.isEmpty || _doctorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    final newReport = MedicalReport(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      doctorName: _doctorController.text,
      date: _selectedDate,
      type: _selectedType,
    );

    context.read<MedicalRecordCubit>().addReport(newReport);
    Navigator.pop(context);
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Report uploaded successfully!"),
        backgroundColor: AppColors.success,
      ),
    );
  }
}
