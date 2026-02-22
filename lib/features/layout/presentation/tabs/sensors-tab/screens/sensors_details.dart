import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/core/theme/app_color.dart';
import 'package:ipredict/features/layout/presentation/widgets/appbar_widget.dart';

class SensorsDetails extends StatelessWidget {
  const SensorsDetails({super.key});

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
                                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                                    decoration: BoxDecoration(
                                        color: AppColor.red.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: AppColor.red)),
                                    child: SvgPicture.asset('assets/icons/Temperature.svg' , color: AppColor.red,)
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Temperature Sensor' , style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.black
                                      ),),
                                      SizedBox(height: 5,),
                                      Text('BME680-A01' , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),),
                                      SizedBox(height: 5,),
                                      Text('Server Room A - Rack 3' , style: TextStyle(color: AppColor.black , fontSize: 15 , fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: AppColor.red.withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color: AppColor.red)),
                                      child: Text('Critical' , style: TextStyle(color: AppColor.red , fontSize: 15 , fontWeight: FontWeight.w400),)
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Container(
                                  padding: EdgeInsets.only(right: 235 , left: 20 , top: 20 , bottom: 20),
                                  decoration: BoxDecoration(
                                      color: AppColor.red.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: AppColor.red)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Current Reading' , style: TextStyle(color: AppColor.gray , fontSize: 20 , fontWeight: FontWeight.w400),),
                                      SizedBox(height: 15,),
                                      Text('78°C' , style: TextStyle(color: AppColor.red , fontSize: 50 , fontWeight: FontWeight.w400),),
                                    ],
                                  )
                              ),
                              SizedBox(height: 20,),
                              Text('Last updated: 2 seconds ago' , style: TextStyle(color: AppColor.gray , fontWeight: FontWeight.w400 , fontSize: 18),),
                              SizedBox(height: 20,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                                children: [
                                  Text('Current' , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),),
                                  SizedBox(height: 10,),
                                  Text('78°C' , style: TextStyle(color: AppColor.red , fontSize: 18 , fontWeight: FontWeight.w400),)
                                ],
                              ),
                            ),
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
                                children: [
                                  Text('Average' , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),),
                                  SizedBox(height: 10,),
                                  Text('48°C' , style: TextStyle(color: AppColor.gray , fontSize: 18 , fontWeight: FontWeight.w400),)
                                ],
                              ),
                            ),
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
                              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
                              child: Column(
                                children: [
                                  Text('Peak' , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),),
                                  SizedBox(height: 10,),
                                  Text('78°C' , style: TextStyle(color: AppColor.orange , fontSize: 18 , fontWeight: FontWeight.w400),)
                                ],
                              ),
                            ),
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
                              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
                              child: Column(
                                children: [
                                  Text('Min' , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),),
                                  SizedBox(height: 10,),
                                  Text('23°C' , style: TextStyle(color: AppColor.blue , fontSize: 18 , fontWeight: FontWeight.w400),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text('Detected Anomalies' , style: TextStyle(color: AppColor.black , fontSize: 30),),
                      SizedBox(height: 20,),
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
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: AppColor.red,
                                          borderRadius: BorderRadius.circular(16),),
                                      child: SvgPicture.asset('assets/icons/warning.svg', color: AppColor.white, width: 25,)
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Critical'.toUpperCase() , style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.red
                                      ),),
                                      SizedBox(height: 5,),
                                      Text('Temperature spike detected - \n exceeded critical threshold of 70°C' , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Spacer(),
                                  Text('Today at 14:32' , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: AppColor.red.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: AppColor.red)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Recorded Value : 78°C' , style: TextStyle(color: AppColor.red , fontSize: 20 , fontWeight: FontWeight.w400),),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
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
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: AppColor.orange,
                                        borderRadius: BorderRadius.circular(16),),
                                      child: SvgPicture.asset('assets/icons/warning.svg', color: AppColor.white, width: 25,)
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Warning'.toUpperCase() , style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.orange
                                      ),),
                                      SizedBox(height: 5,),
                                      Text('Gradual temperature increase - \n cooling system efficiency dropped' , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Spacer(),
                                  Text('Today at 10:15' , style: TextStyle(color: AppColor.gray , fontSize: 15 , fontWeight: FontWeight.w400),),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: AppColor.orange.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: AppColor.orange)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Recorded Value : 45°C' , style: TextStyle(color: AppColor.orange , fontSize: 20 , fontWeight: FontWeight.w400),),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
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
