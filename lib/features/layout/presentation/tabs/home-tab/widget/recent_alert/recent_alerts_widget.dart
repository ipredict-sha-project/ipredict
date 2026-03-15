import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/theme/app_color.dart';

import '../../../../manager/alerts/alerts_bloc.dart';
import '../../../../manager/alerts/alerts_state.dart';

class RecentAlertsWidget extends StatelessWidget {
  const RecentAlertsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertsBloc, AlertsState>(
      builder: (context, state) {
        if (state is! AlertsLoaded) {
          return const SizedBox();
        }

        /// اخر 3 alerts
        final alerts = state.alerts.take(3).toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
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
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// ALERT LIST
              ...alerts.map((alert) {
                Color color = AppColor.orange;
                String icon = 'assets/icons/warning_yellow.svg';

                if (alert.status == "critical") {
                  color = AppColor.red;
                  icon = 'assets/icons/warning_red.svg';
                }

                if (alert.status == "resolved") {
                  color = AppColor.green;
                  icon = 'assets/icons/active.svg';
                }

                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.gray.withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ],
                    color: AppColor.white,
                    border: Border.all(
                      color: AppColor.gray_background,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        icon,
                        width: 50,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              alert.title,
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              alert.location,
                              style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${alert.time.hour}:${alert.time.minute.toString().padLeft(2, '0')}",
                            style: TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            alert.status.toUpperCase(),
                            style: TextStyle(
                              color: color,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
