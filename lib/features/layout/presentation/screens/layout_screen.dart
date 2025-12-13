import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/core/theme/app_color.dart';
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
  List<Widget> tabs = [HomeTab(), SensorsTab(), DevicesTab(), AlertsTab(), SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    colorFilter:
                    const ColorFilter.mode(AppColor.blue, BlendMode.srcIn),
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/sensors.svg'),
                label: 'Sensors',
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: SvgPicture.asset(
                    'assets/icons/sensors.svg',
                    colorFilter:
                    const ColorFilter.mode(AppColor.blue, BlendMode.srcIn),
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/devices.svg'),
                label: 'Devices',
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: SvgPicture.asset(
                    'assets/icons/devices.svg',
                    colorFilter:
                    const ColorFilter.mode(AppColor.blue, BlendMode.srcIn),
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/alerts.svg'),
                label: 'Alerts',
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: SvgPicture.asset(
                    'assets/icons/alerts.svg',
                    colorFilter:
                    const ColorFilter.mode(AppColor.blue, BlendMode.srcIn),
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/settings.svg'),
                label: 'Settings',
                activeIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: SvgPicture.asset(
                    'assets/icons/settings.svg',
                    colorFilter:
                    const ColorFilter.mode(AppColor.blue, BlendMode.srcIn),
                  ),
                )),
          ]),
      body: tabs[currentindex],
    );
  }
}
