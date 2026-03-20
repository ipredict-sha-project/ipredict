import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custoum_btn.dart';
import '../../data/data_source/auth_provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.blue),
      ),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Form(
                key: _formKey,
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
                                color: AppColor.blue,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          FadeInLeftBig(
                            child: Text(
                              "At our app, we take the security of your information seriously.",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: AppColor.gray,
                              ),
                            ),
                          ),
                          const SizedBox(height: 45),
                          TextFormField(
                            controller: provider.emailController,
                            onTapOutside: (_) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            validator: (value) {
                              final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(value ?? "");

                              if (value == null || value.isEmpty) {
                                return 'Enter Email';
                              } else if (!emailValid) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: AppColor.gray,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(color: AppColor.gray),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustoumBtn(
                      isLoading: provider.isLoading,
                      text: 'Reset Password',
                      onTab: provider.isLoading
                          ? null
                          : () {
                        if (_formKey.currentState!.validate()) {
                          provider.resetPassword(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}