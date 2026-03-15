import 'package:flutter/material.dart';

import '../module/alert_module.dart';
import 'alert_card.dart';

class AlertSection extends StatefulWidget {
  final String title;
  final List<AlertModel> alerts;

  const AlertSection({
    super.key,
    required this.title,
    required this.alerts,
  });

  @override
  State<AlertSection> createState() => _AlertSectionState();
}

class _AlertSectionState extends State<AlertSection> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<AlertModel> _alerts = [];

  @override
  void initState() {
    super.initState();
    _alerts = List.from(widget.alerts);
  }

  @override
  void didUpdateWidget(covariant AlertSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.alerts.length > _alerts.length) {
      int index = 0;

      _alerts.insert(index, widget.alerts.first);

      _listKey.currentState?.insertItem(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.alerts.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        AnimatedList(
          key: _listKey,
          initialItemCount: _alerts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index, animation) {
            final alert = _alerts[index];

            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.2),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: AlertCard(alert: alert),
              ),
            );
          },
        )
      ],
    );
  }
}
