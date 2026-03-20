import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/theme/app_color.dart';

import '../../../../manager/alerts/alerts_bloc.dart';
import '../../../../manager/alerts/alerts_state.dart';

import '../../../alerts-tab/widget/alert_card.dart';

class RecentAlertsWidget extends StatelessWidget {
  final VoidCallback onViewAll;

  const RecentAlertsWidget({
    super.key,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertsBloc, AlertsState>(
      builder: (context, state) {
        if (state is! AlertsLoaded) {
          return const SizedBox();
        }

        final alerts = state.alerts.take(3).toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Recent Alerts',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: onViewAll,
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ...alerts.map((alert) {
                return AlertCard(alert: alert);
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
