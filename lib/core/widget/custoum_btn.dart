import 'package:flutter/cupertino.dart';

import '../theme/app_color.dart';

class CustoumBtn extends StatelessWidget {
  bool isLoading;
  String text;
  Function() onTab;
   CustoumBtn({super.key ,required this.text , required this.onTab ,  this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(16),
      padding: EdgeInsets.all(20),
      color: AppColor.blue,
        onPressed: onTab,
        child: AnimatedCrossFade(firstChild: CupertinoActivityIndicator(
          color: AppColor.white,
        ), secondChild: Center(
          child: Text(text , style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColor.white
          ),),
        ), crossFadeState: isLoading? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: Duration(milliseconds: 300))
    );
  }
}
