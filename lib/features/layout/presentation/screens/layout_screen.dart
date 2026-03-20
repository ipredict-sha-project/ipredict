import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ipredict/core/theme/app_color.dart';

import 'package:ipredict/features/layout/presentation/manager/alerts/alerts_bloc.dart';
import 'package:ipredict/features/layout/presentation/manager/alerts/alerts_event.dart';
import 'package:ipredict/features/layout/presentation/manager/home/home_bloc.dart';
import 'package:ipredict/features/layout/presentation/manager/home/home_event.dart';

import 'package:ipredict/features/layout/presentation/tabs/alerts-tab/screens/alerts_tab.dart';
import 'package:ipredict/features/layout/presentation/tabs/devices-tab/screens/devices_tab.dart';
import 'package:ipredict/features/layout/presentation/tabs/home-tab/screens/home_tab.dart';
import 'package:ipredict/features/layout/presentation/tabs/sensors-tab/screens/sensors_tab.dart';
import 'package:ipredict/features/layout/presentation/tabs/settings-tab/screens/settings_tab.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentindex = 0;

  void goToAlertsTab() {
    setState(() {
      currentindex = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      HomeTab(
        onViewAllAlerts: goToAlertsTab,
      ),
      const SensorsTab(),
      const DevicesTab(),
      const AlertsTab(),
      const SettingsTab(),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AlertsBloc()..add(LoadAlertsEvent()),
        ),
        BlocProvider(
          create: (_) => HomeBloc()..add(LoadHomeEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: IndexedStack(
          index: currentindex,
          children: tabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          selectedItemColor: AppColor.blue,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'),
              label: 'Home',
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: SvgPicture.asset(
                  'assets/icons/home.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColor.blue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/sensors.svg'),
              label: 'Sensors',
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: SvgPicture.asset(
                  'assets/icons/sensors.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColor.blue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/devices.svg'),
              label: 'Devices',
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: SvgPicture.asset(
                  'assets/icons/devices.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColor.blue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/alerts.svg'),
              label: 'Alerts',
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: SvgPicture.asset(
                  'assets/icons/alerts.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColor.blue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/settings.svg'),
              label: 'Settings',
              activeIcon: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColor.blue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
