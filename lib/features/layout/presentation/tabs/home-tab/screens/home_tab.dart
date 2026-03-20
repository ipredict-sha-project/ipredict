import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipredict/core/theme/app_color.dart';

import '../../../manager/home/home_bloc.dart';
import '../../../manager/home/home_event.dart';
import '../../../manager/home/home_state.dart';

import '../../../widgets/appbar_widget.dart';

import '../widget/quick_status/quick_status_widget.dart';
import '../widget/recent_alert/recent_alerts_widget.dart';
import '../widget/server_status/server_status_widget.dart';
import '../widget/system_health/system_health_widget.dart';

class HomeTab extends StatelessWidget {
  final VoidCallback onViewAllAlerts;

  const HomeTab({
    super.key,
    required this.onViewAllAlerts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(RefreshHomeEvent());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppbarWidget(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 200),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (state is HomeLoaded) {
                        return Column(
                          children: [
                            const SizedBox(height: 30),
                            Column(
                              children: [
                                Text(
                                  'Dashboard',
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 35,
                                  ),
                                ),
                                Text(
                                  'Real-Time System Overview',
                                  style: TextStyle(
                                    color: AppColor.gray,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30),
                            SystemHealthWidget(
                              temperature: state.temperature,
                              vibration: state.vibration,
                              airQuality: state.airQuality,
                            ),
                            const SizedBox(height: 24),
                            QuickStatusWidget(
                              temperature: state.temperature,
                              vibration: state.vibration,
                              airQuality: state.airQuality,
                            ),
                            const SizedBox(height: 24),
                            RecentAlertsWidget(
                              onViewAll: onViewAllAlerts,
                            ),
                            const SizedBox(height: 24),
                            ServerStatusWidget(
                              online: state.onlineServers,
                              warning: state.warningServers,
                              offline: state.offlineServers,
                              total: state.totalServers,
                            ),
                            const SizedBox(height: 40),
                          ],
                        );
                      }

                      if (state is HomeError) {
                        return Center(
                          child: Text(
                            "Failed to load dashboard data",
                            style: TextStyle(color: AppColor.red),
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
