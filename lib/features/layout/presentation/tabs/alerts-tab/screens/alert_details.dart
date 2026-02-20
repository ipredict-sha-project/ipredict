import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../../core/theme/app_color.dart';
import '../../../widgets/appbar_widget.dart';

class AlertDetails extends StatelessWidget {
  const AlertDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarWidget(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
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
                            padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 13),
                            child: Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
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
                                          color: AppColor.red.withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color: AppColor.red)),
                                      child: SvgPicture.asset('assets/icons/warning.svg' , color: AppColor.red,)
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Critical Temperature \n Threshold Exceeded' , style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.black
                                      ),),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                              decoration: BoxDecoration(
                                                  color: AppColor.red.withValues(alpha: 0.1),
                                                  borderRadius: BorderRadius.circular(16),
                                                  border: Border.all(color: AppColor.red)),
                                              child: Text('Critical'.toUpperCase() , style: TextStyle(color: AppColor.red , fontSize: 15 , fontWeight: FontWeight.w400),)
                                          ),
                                          SizedBox(width: 5,),
                                          Container(
                                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                              decoration: BoxDecoration(
                                                  color: AppColor.gray.withValues(alpha: 0.1),
                                                  borderRadius: BorderRadius.circular(16),
                                                  border: Border.all(color: AppColor.gray)),
                                              child: Text('open'.toUpperCase() , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),)
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                                  decoration: BoxDecoration(
                                      color: AppColor.red.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: AppColor.red)),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Detected' , style: TextStyle(color: AppColor.gray , fontSize: 18 , fontWeight: FontWeight.w400),),
                                          SizedBox(height: 5,),
                                          Text('Feb 7, 2026 at 14:32' , style: TextStyle(color: AppColor.red , fontSize: 18 , fontWeight: FontWeight.w400),),
                                        ],
                                      ),
                                      SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Duration' , style: TextStyle(color: AppColor.gray , fontSize: 18 , fontWeight: FontWeight.w400),),
                                          SizedBox(height: 5,),
                                          Text('2 hours 15 minutes' , style: TextStyle(color: AppColor.red , fontSize: 18 , fontWeight: FontWeight.w400),),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                              SizedBox(height: 20,),
                              Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Affected Server' , style: TextStyle(color: AppColor.gray , fontWeight: FontWeight.w400 , fontSize: 15),),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/server.svg' , width: 20, color: AppColor.gray,),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Production Server 01' , style: TextStyle(color: AppColor.black , fontWeight: FontWeight.w400 , fontSize: 18),),
                                          Text('SRV-PROD-001' , style: TextStyle(color: AppColor.gray , fontWeight: FontWeight.w400 , fontSize: 18),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Iconsax.location_outline , color: AppColor.gray,),
                                      SizedBox(width: 5,),
                                      Text('Data Center A - Rack 3' , style: TextStyle(color: AppColor.black , fontWeight: FontWeight.w400 , fontSize: 18),),
                                    ],
                                  ),
                                ],
                              )),
                              SizedBox(height: 20,),
                              Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Affected Sensor' , style: TextStyle(color: AppColor.gray , fontWeight: FontWeight.w400 , fontSize: 15),),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          SvgPicture.asset('assets/icons/Temperature.svg' , width: 15, color: AppColor.red,),
                                          SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Temperature Sensor' , style: TextStyle(color: AppColor.black , fontWeight: FontWeight.w400 , fontSize: 18),),
                                              Text('BME680-A01' , style: TextStyle(color: AppColor.gray , fontWeight: FontWeight.w400 , fontSize: 18),),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('78°C' , style: TextStyle(color: AppColor.red , fontSize: 25 , fontWeight: FontWeight.w400),),
                                              Text('Threshold: 70°C' , style: TextStyle(color: AppColor.gray , fontSize: 18 , fontWeight: FontWeight.w400),),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 20,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(height: 40,)

                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
