import 'package:cliniq/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:cliniq/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:cliniq/features/appointments/presentation/bloc/appointment_state.dart';
import 'package:cliniq/features/appointments/presentation/widgets/appointment_list.dart';
import 'package:cliniq/core/theme/app_colors.dart';
import 'package:cliniq/core/theme/app_text.dart';
import 'package:cliniq/features/appointments/domain/entities/appointment.dart';
import 'package:cliniq/shared/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<AppointmentBloc>().add(GetUpcomingAppointmentEvent());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Appointments"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 12),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isDark ? Colors.white12 : AppColors.border),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: isDark ? Colors.white38 : AppColors.textSecondary,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primary,
                boxShadow: isDark ? [] : [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              labelStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
              unselectedLabelStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
              tabs: const [
                Tab(text: "Upcoming"),
                Tab(text: "History"),
                Tab(text: "Cancelled"),
              ],
            ),
          ),
        ),
      ),
      body: BlocConsumer<AppointmentBloc, AppointmentState>(
        listener: (context, state) {
          if (state is AppointmentBooked || state is AppointmentCancelled) {
            context.read<AppointmentBloc>().add(GetUpcomingAppointmentEvent());
          }
          if (state is AppointmentError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: LoadingWidget());
          }

          if (state is UpcomingAppointmentsLoaded) {
            return TabBarView(
              controller: _tabController,
              children: [
                _buildTabList(state.appointments, AppointmentStatus.upcoming),
                _buildTabList(state.appointments, AppointmentStatus.completed),
                _buildTabList(state.appointments, AppointmentStatus.cancelled),
              ],
            );
          }

          return TabBarView(
            controller: _tabController,
            children: List.generate(
              3,
              (_) => const AppointmentList(appointments: []),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabList(List<Appointment> appointments, AppointmentStatus status) {
    return AppointmentList(
      appointments: appointments.where((a) => a.status == status).toList(),
    );
  }
}