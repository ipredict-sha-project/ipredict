import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/app_color.dart';

class AlertDetilsRootCauseAnnlysis extends StatelessWidget {
  const AlertDetilsRootCauseAnnlysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        color: AppColor.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColor.blue)),
                    child: SvgPicture.asset('assets/icons/help.svg' , color: AppColor.blue,)
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Root Cause Analysis' , style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black
                    ),),
                    SizedBox(height: 5,),
                    Text('AI-powered diagnosis' , style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.blue.withValues(alpha: 0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4))
                  ],
                  color: AppColor.blue.withValues(alpha: 0.1),
                  border: Border.all(color: AppColor.blue)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cooling System Degradation' , style: TextStyle(
                        color: AppColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                    ),),
                    SizedBox(height: 5,),
                    Text('HVAC cooling efficiency has decreased by 42% over the past 6 hours. Airflow to server rack has been restricted, preventing adequate heat dissipation.', style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contributing Factors:' , style: TextStyle(
                    color: AppColor.gray,
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 5,),
                Text('Air filter clogging detected (78% blockage)' , style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 5,),
                Text('Compressor pressure 15% below optimal' , style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 5,),
                Text('Ambient temperature in data center increased by 3°C' , style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 10,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
