import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/theme/app_color.dart';

class LiveGraphsWidget extends StatelessWidget {
  const LiveGraphsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 166,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: AppColor.gray.withValues(alpha: 0.5),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4))
          ],
          color: AppColor.white,
          border: Border.all(color: AppColor.gray_background)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21),
            child: Text(
              'Live Mini Graphs',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 68,
                height: 84,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.gray_background,
                    border: Border.all(color: AppColor.gray_background)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/icons/live_graph.svg'),
                    Text(
                      'Temp',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Container(
                width: 68,
                height: 84,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.gray_background,
                    border: Border.all(color: AppColor.gray_background)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/icons/live_graph.svg'),
                    Text(
                      'Sound',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Container(
                width: 68,
                height: 84,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.gray_background,
                    border: Border.all(color: AppColor.gray_background)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/icons/live_graph.svg'),
                    Text(
                      'Smoke',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Container(
                width: 68,
                height: 84,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.gray_background,
                    border: Border.all(color: AppColor.gray_background)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/icons/live_graph.svg'),
                    Text(
                      'Vibration',
                      style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
