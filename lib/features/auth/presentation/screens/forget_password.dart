import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipredict/features/auth/presentation/manager/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custoum_btn.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.blue),
          title: Text('Forget Password' , style: TextStyle(
            color: AppColor.blue,
            fontSize: 24
          ),),),
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInLeftBig(
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blue),
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          FadeInLeftBig(
                              child: Text(
                                "At our app, we take the security of your information seriously.",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.gray),
                              )),
                          SizedBox(height: 45,),
                          TextFormField(
                            controller: provider.emailController,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            validator: (value) {
                              final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value ?? "");
                              if (value == null || value.isEmpty) {
                                return 'Enter Email';
                              } else if (!emailValid) {
                                return 'Invalid Email';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                        color: AppColor.gray, width: 1)),
                                // prefixIcon: Icon(Icons.mail_outline),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: AppColor.gray)),
                          ),
                        ],
                      ),
                    ),
                    CustoumBtn(text: 'Reset Password', onTab: () {})
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
