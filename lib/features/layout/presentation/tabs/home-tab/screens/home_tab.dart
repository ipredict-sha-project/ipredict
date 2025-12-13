import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipredict/core/theme/app_color.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 24,),
                  Container(
                    width: 400,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.gray_background.withValues(alpha: 0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3)
                          )
                        ],
                        color: AppColor.white,
                      border: Border.all(color: AppColor.gray_background )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('87%' , style: TextStyle(color: AppColor.black , fontSize: 36 , fontWeight: FontWeight.w400),),
                            Text('Good' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),)
                          ],
                        ),
                        Column(
                          children: [
                            Text('System Health' , style: TextStyle(color: AppColor.black ,fontSize: 16 , fontWeight: FontWeight.w400),),
                            Text('Good' , style: TextStyle(color: AppColor.blue , fontSize: 28 , fontWeight: FontWeight.w400),),
                            Text.rich(TextSpan(text: 'Status',
                                style: TextStyle(
                                    color: AppColor.gray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    decorationColor: AppColor.gray),
                                children: [
                              TextSpan(
                                  text: ' Stable',
                                  style: TextStyle(
                                      color: AppColor.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      decorationColor: AppColor.blue),
                              )
                            ])),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  Container(
                    width: 400,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.gray_background.withValues(alpha: 0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3)
                          )
                        ],
                        color: AppColor.white,
                        border: Border.all(color: AppColor.gray_background )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 21),
                          child: Text('Quick Stats' , style: TextStyle(color: AppColor.black , fontSize: 16 , fontWeight: FontWeight.w400),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/Temperature.svg'),
                                  Column(
                                    children: [
                                      Text('Temperature' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),),
                                      Text('28.6°C' , style: TextStyle(color: AppColor.black , fontSize: 16 , fontWeight: FontWeight.w400),),
                                      Text('Normal' , style: TextStyle(color: AppColor.green , fontSize: 14 , fontWeight: FontWeight.w400),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/Humidity.svg'),
                                  Column(
                                    children: [
                                      Text('Humidity' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),),
                                      Text('41%' , style: TextStyle(color: AppColor.black , fontSize: 16 , fontWeight: FontWeight.w400),),
                                      Text('Stable' , style: TextStyle(color: AppColor.green , fontSize: 14 , fontWeight: FontWeight.w400),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/warning.svg'),
                                  Column(
                                    children: [
                                      Text('Smoke Level' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),),
                                      Text('210 ppm' , style: TextStyle(color: AppColor.black , fontSize: 16 , fontWeight: FontWeight.w400),),
                                      Text('Warning' , style: TextStyle(color: AppColor.orange , fontSize: 14 , fontWeight: FontWeight.w400),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/Vibration.svg'),
                                  Column(
                                    children: [
                                      Text('Vibration' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),),
                                      Text('0.09 g' , style: TextStyle(color: AppColor.black , fontSize: 16 , fontWeight: FontWeight.w400),),
                                      Text('Normal' , style: TextStyle(color: AppColor.green , fontSize: 14 , fontWeight: FontWeight.w400),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  Container(
                    width: 400,
                    height: 166,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.gray_background.withValues(alpha: 0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3)
                          )
                        ],
                        color: AppColor.white,
                        border: Border.all(color: AppColor.gray_background )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 21),
                          child: Text('Live Mini Graphs' , style: TextStyle(color: AppColor.black , fontSize: 16 , fontWeight: FontWeight.w400),),
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
                                  border: Border.all(color: AppColor.gray_background )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset('assets/icons/live_graph.svg'),
                                  Text('Temp' , style: TextStyle(
                                    color: AppColor.gray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                  ),)
                                ],
                              ),
                            ),
                            Container(
                              width: 68,
                              height: 84,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColor.gray_background,
                                  border: Border.all(color: AppColor.gray_background )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset('assets/icons/live_graph.svg'),
                                  Text('Sound' , style: TextStyle(
                                      color: AppColor.gray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),)
                                ],
                              ),
                            ),
                            Container(
                              width: 68,
                              height: 84,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColor.gray_background,
                                  border: Border.all(color: AppColor.gray_background )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset('assets/icons/live_graph.svg'),
                                  Text('Smoke' , style: TextStyle(
                                      color: AppColor.gray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),)
                                ],
                              ),
                            ),
                            Container(
                              width: 68,
                              height: 84,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColor.gray_background,
                                  border: Border.all(color: AppColor.gray_background )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset('assets/icons/live_graph.svg'),
                                  Text('Vibration' , style: TextStyle(
                                      color: AppColor.gray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),)
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  Container(
                    width: 400,
                    height: 260,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.gray_background.withValues(alpha: 0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3)
                          )
                        ],
                        color: AppColor.white,
                        border: Border.all(color: AppColor.gray_background )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 21),
                          child: Text('Recent Alerts' , style: TextStyle(color: AppColor.black , fontSize: 16 , fontWeight: FontWeight.w400),),
                        ),
                        Container(
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColor.gray_background,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/warning_red.svg'),
                              SizedBox(width: 12,),
                              Column(
                                children: [
                                  Text('Temperature High' , style: TextStyle(color: AppColor.black , fontSize: 16, fontWeight: FontWeight.w400),),
                                  Text('Server 2' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),)
                                ],
                              ),
                              Spacer(),
                              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios , weight: 15 , color: AppColor.gray,))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColor.gray_background,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/warning_yellow.svg'),
                              SizedBox(width: 12,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Smoke Spike Detected' , style: TextStyle(color: AppColor.black , fontSize: 16, fontWeight: FontWeight.w400),),
                                  Text('Lab Room' , style: TextStyle(color: AppColor.gray , fontSize: 14 , fontWeight: FontWeight.w400),)
                                ],
                              ),
                              Spacer(),
                              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios , weight: 15 , color: AppColor.gray,))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  Container(
                    width: 400,
                    height: 260,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.gray_background.withValues(alpha: 0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3)
                          )
                        ],
                        color: AppColor.white,
                        border: Border.all(color: AppColor.gray_background )
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 21),
                              child: Text('Recent Alerts' , style: TextStyle(color: AppColor.black , fontSize: 16 , fontWeight: FontWeight.w400),),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text('3 Online' , style: TextStyle(color: AppColor.green , fontSize: 14 , fontWeight: FontWeight.w400),),
                                VerticalDivider(
                                  color: AppColor.black,
                                  thickness: 2,
                                ),
                                Text('1 Offline' , style: TextStyle(color: AppColor.black , fontSize: 14 , fontWeight: FontWeight.w400),)
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 48 , vertical: 16),
                              decoration: BoxDecoration(
                                color: AppColor.green,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SvgPicture.asset('assets/icons/server.svg'),
                                  Text('Server A' , style: TextStyle(color: AppColor.white , fontSize: 14 , fontWeight: FontWeight.w400),),
                                  Text('Room 101' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
                                  Text('Good' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 48 , vertical: 16),
                              decoration: BoxDecoration(
                                color: AppColor.green,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SvgPicture.asset('assets/icons/server.svg'),
                                  Text('Server B' , style: TextStyle(color: AppColor.white , fontSize: 14 , fontWeight: FontWeight.w400),),
                                  Text('Data Center 1' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
                                  Text('Good' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 48 , vertical: 16),
                            //   decoration: BoxDecoration(
                            //     color: AppColor.red,
                            //     borderRadius: BorderRadius.circular(16)
                            //   ),
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //     children: [
                            //       Row(
                            //         children: [
                            //           SvgPicture.asset('assets/icons/server.svg'),
                            //           Spacer(),
                            //           SvgPicture.asset('assets/icons/warning_red_status.svg')
                            //         ],
                            //       ),
                            //       Text('Server C' , style: TextStyle(color: AppColor.white , fontSize: 14 , fontWeight: FontWeight.w400),),
                            //       Text('Room 202' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
                            //       Text('Error (Overheat)' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 48 , vertical: 16),
                            //   decoration: BoxDecoration(
                            //       color: AppColor.green,
                            //       borderRadius: BorderRadius.circular(16)
                            //   ),
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //     children: [
                            //       SvgPicture.asset('assets/icons/server.svg'),
                            //       Text('Server D' , style: TextStyle(color: AppColor.white , fontSize: 14 , fontWeight: FontWeight.w400),),
                            //       Text('Lab Rack' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
                            //       Text('Good' , style: TextStyle(color: AppColor.white , fontSize: 12 , fontWeight: FontWeight.w400),),
                            //     ],
                            //   ),
                            // ),

                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                ],
              ),
            ),
          )
      ),
    );
  }
}
