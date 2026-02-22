import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/app_color.dart';

class AlertDetailsSystemImpact extends StatelessWidget {
  const AlertDetailsSystemImpact({super.key});

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
                        color: AppColor.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColor.orange)),
                    child: SvgPicture.asset('assets/icons/warning.svg' , color: AppColor.orange, width: 20,)
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('System Impact' , style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black
                    ),),
                    SizedBox(height: 5,),
                    Text('Current and predicted effects' , style: TextStyle(
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
                        Text('Risk Level:' , style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                        Spacer(),
                        Text('High'.toUpperCase() , style: TextStyle(
                            color: AppColor.orange,
                            fontSize: 15 ,
                            fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('Prediction Window:' , style: TextStyle(
                            color: AppColor.gray,
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                        Spacer(),
                        Text('12 - 18 hours'.toUpperCase() , style: TextStyle(
                            color: AppColor.orange,
                            fontSize: 15 ,
                            fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Affected Components:' , style: TextStyle(
                    color: AppColor.gray,
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 5,),
                Text('CPU thermal throttling initiated' , style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 5,),
                Text('Storage array read/write speed reduced' , style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 5,),
                Text('Network latency increased by 23%' , style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 10,)
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
                        SvgPicture.asset('assets/icons/warning.svg' , color: AppColor.red, width: 20,),
                        SizedBox(width: 5,),
                        Text('Critical Prediction' , style: TextStyle(
                            color: AppColor.red,
                            fontSize: 20 ,
                            fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('Server will enter emergency shutdown if temperature exceeds 85°C', style: TextStyle(
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
