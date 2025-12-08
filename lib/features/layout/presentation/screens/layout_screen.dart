import 'package:flutter/material.dart';
import 'package:ipredict/core/theme/app_color.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: Text('Layout Screen' , style: TextStyle(
        color: AppColor.black
      ),),
    );
  }
}
