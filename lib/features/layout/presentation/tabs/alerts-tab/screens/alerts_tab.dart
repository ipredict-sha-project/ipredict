import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/app_color.dart';
import '../../../widgets/appbar_widget.dart';

import '../../../manager/alerts/alerts_bloc.dart';
import '../../../manager/alerts/alerts_event.dart';
import '../../../manager/alerts/alerts_state.dart';

import '../../../../data/models/alert_module.dart';
import '../widget/alert_card.dart';
import '../widget/total_alert_row.dart';

import 'alert_details.dart';

class AlertsTab extends StatefulWidget {
  const AlertsTab({super.key});

  @override
  State<AlertsTab> createState() => _AlertsTabState();
}

class _AlertsTabState extends State<AlertsTab> {
  AlertModel? selectedAlert;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlertsBloc()..add(LoadAlertsEvent()),
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: selectedAlert == null
              ? _buildAlertsList()
              : AlertDetails(
                  alert: selectedAlert!,
                  onBack: () {
                    setState(() {
                      selectedAlert = null;
                    });
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildAlertsList() {
    return BlocBuilder<AlertsBloc, AlertsState>(
      builder: (context, state) {
        if (state is AlertsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AlertsLoaded) {
          final alerts = state.alerts;

          return SingleChildScrollView(
            child: Column(
              children: [
                /// APP BAR
                AppbarWidget(),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Alerts",
                        style: TextStyle(fontSize: 35),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Critical Events & System Notifications",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      TotalAlertRow(
                        total: state.total,
                        critical: state.critical,
                        warning: state.warning,
                        resolved: state.resolved,
                        unread: state.total - state.resolved,
                      ),
                      const SizedBox(height: 25),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: alerts.length,
                        itemBuilder: (context, index) {
                          final alert = alerts[index];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAlert = alert;
                              });
                            },
                            child: AlertCard(alert: alert),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
