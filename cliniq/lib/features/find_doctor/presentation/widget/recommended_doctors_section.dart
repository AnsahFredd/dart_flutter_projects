import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/find_doctor/presentation/widget/recommended_doctors_card.dart';
import 'package:cliniq/shared/widget/loading_widget.dart';
import 'package:cliniq/shared/widget/section_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_bloc.dart';
import 'package:cliniq/features/find_doctor/presentation/bloc/find_doctor_state.dart';
import 'package:flutter/material.dart';

class RecommendedDoctorsSection extends StatelessWidget {
  const RecommendedDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindDoctorBloc, FindDoctorState>(
      builder: (context, state) {
        if (state is FindDoctorLoading) {
          return const Center(child: LoadingWidget());
        } else if (state is FindDoctorError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 48),
                const SizedBox(height: 16),
                Text(state.message, style: AppText.titleMedium),
              ],
            ),
          );
        } else if (state is FindDoctorLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: "Recommended Doctors",
                onActionPressed: () {},
              ),
              if (state.doctors.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_off_rounded, color: AppColors.textHint.withValues(alpha: 0.5), size: 64),
                        const SizedBox(height: 16),
                        Text(
                          "No doctors found",
                          style: AppText.titleMedium.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.doctors.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: RecommendedDoctorsCard(
                          doctor: state.doctors[index],
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

