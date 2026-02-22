import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/app_color.dart';

class AlertDetailsRecommendedActions extends StatelessWidget {
  const AlertDetailsRecommendedActions({super.key});

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
                        color: AppColor.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColor.green)),
                    child: SvgPicture.asset('assets/icons/warning.svg' , color: AppColor.green, width: 20,)
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recommended Actions' , style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black
                    ),),
                    SizedBox(height: 5,),
                    Text('Prioritized response plan' , style: TextStyle(
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
                        color: AppColor.red.withValues(alpha: 0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4))
                  ],
                  color: AppColor.red.withValues(alpha: 0.1),
                  border: Border.all(color: AppColor.red)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/security.svg' , color: AppColor.red, width: 20,),
                        SizedBox(width: 5,),
                        Text('Immediate'.toUpperCase() , style: TextStyle(
                            color: AppColor.red,
                            fontSize: 20 ,
                            fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('Dispatch technician to inspect and replace HVAC air filters', style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.orange.withValues(alpha: 0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4))
                  ],
                  color: AppColor.orange.withValues(alpha: 0.1),
                  border: Border.all(color: AppColor.orange)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/warning.svg' , color: AppColor.orange, width: 20,),
                        SizedBox(width: 5,),
                        Text('High'.toUpperCase() , style: TextStyle(
                            color: AppColor.orange,
                            fontSize: 20 ,
                            fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('Reduce server workload by 40% to lower heat generation', style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.yellow.withValues(alpha: 0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4))
                  ],
                  color: AppColor.yellow.withValues(alpha: 0.1),
                  border: Border.all(color: AppColor.yellow)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/warning.svg' , color: AppColor.yellow, width: 20,),
                        SizedBox(width: 5,),
                        Text('Medium'.toUpperCase() , style: TextStyle(
                            color: AppColor.yellow,
                            fontSize: 20 ,
                            fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('Schedule full HVAC system diagnostic within 24 hours', style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
