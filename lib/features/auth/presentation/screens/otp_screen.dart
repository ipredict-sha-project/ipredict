import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custoum_btn.dart';
import '../../data/data_source/auth_provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with CodeAutoFill {
  @override
  void initState() {
    super.initState();
    listenForCode();
  }

  @override
  void codeUpdated() {
    final provider = context.read<AuthProvider>();
    provider.otpController.text = code ?? "";
  }

  @override
  void dispose() {
    cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, _) {
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
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInLeftBig(
                          child: Text(
                            'OTP Verification',
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
                            "Add a PIN number to make your account more secure and easy to sign in.",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppColor.gray,
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                        Center(
                          child: Pinput(
                            controller: provider.otpController,
                            length: 6,
                            onCompleted: (value) {
                              provider.verifyOtp(context);
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            provider.canResend
                                ? TextButton(
                              onPressed: () {
                                provider.resendOtp(context);
                              },
                              child: const Text("Resend Code"),
                            )
                                : Text(
                              "Resend in ${provider.resendSeconds}s",
                              style: TextStyle(color: AppColor.gray),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustoumBtn(
                    isLoading: provider.isLoading,
                    text: "verify",
                    onTab: provider.isLoading
                        ? null
                        : () {
                      provider.verifyOtp(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
