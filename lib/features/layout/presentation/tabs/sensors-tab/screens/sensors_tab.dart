import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/app_color.dart';
import '../../../manager/sensors/sensor_bloc.dart';
import '../../../manager/sensors/sensor_event.dart';
import '../../../manager/sensors/sensor_state.dart';
import '../../../widgets/appbar_widget.dart';

import '../widget/SystemStatus.dart';
import '../widget/sensor_card.dart';
import 'sensors_details.dart';

import '../../../../data/models/sensor_module.dart';

class SensorsTab extends StatefulWidget {
  const SensorsTab({super.key});

  @override
  State<SensorsTab> createState() => _SensorsTabState();
}

class _SensorsTabState extends State<SensorsTab> {
  SensorModel? selectedSensor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SensorsBloc()..add(LoadSensorsEvent()),
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: selectedSensor == null
              ? _buildSensorsList()
              : SensorsDetails(
            sensor: selectedSensor!,
          ),
        ),
      ),
    );
  }

  Widget _buildSensorsList() {
    return BlocBuilder<SensorsBloc, SensorsState>(
      builder: (context, state) {
        /// LOADING
        if (state is SensorsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        /// LOADED
        if (state is SensorsLoaded) {
          final sensors = state.sensors;

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
                        "Sensors",
                        style: TextStyle(fontSize: 35),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Live Monitoring & Analytics",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      /// SYSTEM STATUS
                      Systemstatus(sensors: sensors),

                      const SizedBox(height: 25),

                      /// EMPTY STATE
                      if (sensors.isEmpty) ...[
                        const SizedBox(height: 100),
                        const Icon(
                          Icons.sensors_off,
                          size: 80,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "No Sensors Found",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey,
                          ),
                        ),
                      ],

                      /// LIST
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: sensors.length,
                        itemBuilder: (context, index) {
                          final sensor = sensors[index];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSensor = sensor;
                              });
                            },
                            child: Column(
                              children: [
                                SensorCard(sensor: sensor),
                                const SizedBox(height: 25),
                              ],
                            ),
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

        /// ERROR
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
    );
  }
}