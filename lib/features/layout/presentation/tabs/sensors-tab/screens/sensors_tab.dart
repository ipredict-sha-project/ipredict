import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/app_color.dart';
import '../../../manager/sensors/sensor_bloc.dart';
import '../../../manager/sensors/sensor_event.dart';
import '../../../manager/sensors/sensor_state.dart';
import '../../../widgets/appbar_widget.dart';

import '../widget/SystemStatus.dart';
import '../widget/sensor_card.dart';

class SensorsTab extends StatelessWidget {
  const SensorsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SensorsBloc()..add(LoadSensorsEvent()),
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: BlocBuilder<SensorsBloc, SensorsState>(
            builder: (context, state) {
              if (state is SensorsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is SensorsLoaded) {
                return ListView(
                  children: [
                    AppbarWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const Text(
                            'Sensors',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Live Monitoring & Analytics',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Systemstatus(sensors: state.sensors),
                          const SizedBox(height: 30),
                          ...state.sensors.map((sensor) {
                            return Column(
                              children: [
                                SensorCard(sensor: sensor),
                                const SizedBox(height: 25),
                              ],
                            );
                          }).toList(),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                );
              }

              if (state is SensorsError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Failed to load sensors"),
                      ElevatedButton(
                        onPressed: () {
                          context.read<SensorsBloc>().add(LoadSensorsEvent());
                        },
                        child: const Text("Retry"),
                      )
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
