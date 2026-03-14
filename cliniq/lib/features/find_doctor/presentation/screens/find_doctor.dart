import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/find_doctor/presentation/widget/doctor_category_filter.dart';
import 'package:cliniq/features/find_doctor/presentation/widget/recommended_doctors_section.dart';
import 'package:cliniq/shared/widget/custom_app_bar.dart';
import 'package:cliniq/shared/widget/custom_search.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_bloc.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_event.dart';

class FindDoctor extends StatefulWidget {
  const FindDoctor({super.key});

  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FindDoctorBloc>().add(GetDoctorsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Find Doctor",
        leftIconData: Icons.arrow_back_ios_new_rounded,
        onLeftPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Who are you looking for?",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const CustomSearch(
              hintText: "Search doctor, speciality...",
            ),
            const SizedBox(height: 24),
            const DoctorCategoryFilter(),
            const SizedBox(height: 12),
            const Expanded(
              child: RecommendedDoctorsSection(),
            ),
          ],
        ),
      ),
    );
  }
}
