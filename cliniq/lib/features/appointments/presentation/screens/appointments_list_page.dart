import 'package:cliniq/core/routing/routes.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:cliniq/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:cliniq/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:cliniq/features/appointments/presentation/bloc/appointment_state.dart';
import 'package:cliniq/features/appointments/presentation/widgets/appointment_type_selector.dart';
import 'package:cliniq/features/appointments/presentation/widgets/date_selector.dart';
import 'package:cliniq/features/appointments/presentation/widgets/doctor_card_mini.dart';
import 'package:cliniq/features/appointments/presentation/widgets/slot_selector_grid.dart';
import 'package:cliniq/shared/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsListPage extends StatefulWidget {
  const AppointmentsListPage({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.hospital,
    required this.image,
    required this.rating,
  });

  final String doctorName;
  final String speciality;
  final String hospital;
  final String image;
  final String rating;

  @override
  State<AppointmentsListPage> createState() => _AppointmentsListPageState();
}

class _AppointmentsListPageState extends State<AppointmentsListPage> {
  AppointmentType selectedType = AppointmentType.inPerson;
  DateTime? selectedDate;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocListener<AppointmentBloc, AppointmentState>(
      listener: (context, state) {
        if (state is AppointmentBooked) {
          // Assuming we want to show success for the last booked appointment
          // We might need to pass the appointment back from the state or just use the local one
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Book Appointment",
          leftIconData: Icons.arrow_back_ios_new_rounded,
          leftIconColor: isDark ? Colors.white : AppColors.textPrimary,
          onLeftPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorCardMini(
                      doctorName: widget.doctorName,
                      speciality: widget.speciality,
                      hospital: widget.hospital,
                      image: widget.image,
                      rating: widget.rating,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Service Type",
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 16),
                    AppointmentTypeSelector(
                      onChanged: (type) => setState(() => selectedType = type),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Select Date",
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 16),
                    DateSelector(
                      onChanged: (date) => setState(() => selectedDate = date),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Available Slots",
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 16),
                    SlotSelectorGrid(
                      onChanged: (time) => setState(() => selectedTime = time),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            boxShadow: isDark ? [] : [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
            border: isDark ? const Border(top: BorderSide(color: Colors.white12)) : null,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: isDark ? 0 : 8,
              shadowColor: AppColors.secondary.withValues(alpha: 0.4),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              if (selectedDate == null || selectedTime == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please select a date and time slot"),
                    backgroundColor: AppColors.error,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return;
              }

              final booked = Appointment(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                doctorName: widget.doctorName,
                speciality: widget.speciality,
                hospital: widget.hospital,
                image: widget.image,
                rating: widget.rating,
                dateTime: selectedDate!,
                status: AppointmentStatus.upcoming,
                type: selectedType,
              );

              context.read<AppointmentBloc>().add(BookAppointmentEvent(booked));
              Navigator.pushReplacementNamed(
                context, 
                Routes.bookingSuccess,
                arguments: booked,
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Confirm Booking",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
