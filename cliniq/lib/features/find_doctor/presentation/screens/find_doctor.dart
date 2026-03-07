import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/features/find_doctor/presentation/widget/doctor_category_filter.dart';
import 'package:cliniq/features/find_doctor/presentation/widget/recommended_doctors_section.dart';
import 'package:cliniq/shared/widget/custom_app_bar.dart';
import 'package:cliniq/shared/widget/custom_search.dart';
import 'package:flutter/material.dart';

class FindDoctor extends StatelessWidget {
  const FindDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Find Doctor",
        leftIconData: Icons.arrow_back,
        leftIconColor: AppColors.secondary,
        onLeftPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(child: 
        Column(
          children: [
            const SizedBox(height: 16,),
            CustomSearch(),
            SizedBox(height: 16,),
            DoctorCategoryFilter(),
            const SizedBox(height: 10,),
            Expanded(child: SingleChildScrollView(child: RecommendedDoctorsSection())),
          ],
        ),
      ),
    );
  }
}
