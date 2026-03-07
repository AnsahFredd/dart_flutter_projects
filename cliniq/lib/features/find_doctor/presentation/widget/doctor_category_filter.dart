import 'package:cliniq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DoctorCategoryFilter extends StatefulWidget {
  const DoctorCategoryFilter({super.key});

  @override
  State<DoctorCategoryFilter> createState() => _DoctorCategoryFilterState();
}

class _DoctorCategoryFilterState extends State<DoctorCategoryFilter> {
  final List<String> categories = [
    "All",
    "Cardiologist",
    "Dermatologist",
    "Neurologist",
    "Pediatrician",
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(categories.length, (index) {
          final isSelected = _selectedIndex == index;
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: ChoiceChip(
              shape: StadiumBorder(
                side: BorderSide.none,
              ) ,
              label: Text(categories[index]),
              selected: isSelected,
              onSelected: (_) => setState(() {
                _selectedIndex = index;
              }),
              showCheckmark: false,
              backgroundColor: Colors.grey.shade100,
              selectedColor: AppColors.secondary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal
              ),
              
            ),
          );
        }),
      ),
    );
  }
}
