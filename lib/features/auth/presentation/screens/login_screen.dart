import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes_manager/routes/app_route_name.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custoum_btn.dart';
import '../manager/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(),
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInLeftBig(
                                child: Text(
                              'Welcome Back',
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
                              "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.gray),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 22,
                        ),
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
                        SizedBox(
                          height: 16,
                        ),
                        ValueListenableBuilder(
                          valueListenable: provider.password,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: provider.passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please , Enter Password';
                                } else if (value.length < 6) {
                                  return 'Password Must Be More Than 6 Char';
                                } else {
                                  return null;
                                }
                              },
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              obscureText: value,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                        color: AppColor.gray, width: 1)),
                                // prefixIcon: Icon(Icons.lock),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: AppColor.gray),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      provider.password.value =
                                          !provider.password.value;
                                    },
                                    child: Icon(provider.isShowPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                               Navigator.pushNamed(context, AppRouteName.forgetpassword);
                              },
                              child: Text(
                                'Forget Password?',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: AppColor.blue,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        CustoumBtn(
                          isLoading: provider.isLoading,
                          text: 'Login',
                          onTab: () {
                            provider.login(context);
                          },
                        ),
                        SizedBox(
                          height: 39,
                        ),
                        Row(children: <Widget>[
                          Expanded(
                              child: Divider(
                            color: AppColor.gray,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Or sign in with",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  color: AppColor.gray,
                                  fontWeight: FontWeight.w400,
                                  decorationColor: AppColor.gray),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            color: AppColor.gray,
                          )),
                        ]),
                        SizedBox(
                          height: 38,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () async{
                              await provider.signInWithGoogle(context);
                              },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColor.off_white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/logos/google_logo.svg'),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColor.off_white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: SvgPicture.asset(
                                    'assets/logos/facebook_logo.svg'),
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColor.off_white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: SvgPicture.asset(
                                    'assets/logos/apple_logo.svg'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'By logging, you agree to our ',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: AppColor.gray,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Terms & Conditions',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                  // ..onTap = () {
                                  //   Navigator.pushNamed(
                                  //       context, AppRouteName.register);
                                  // }
                                  ),
                              TextSpan(
                                text: ' and ',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: AppColor.gray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                  text: 'Privacy Policy.',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                  // ..onTap = () {
                                  //   Navigator.pushNamed(
                                  //       context, AppRouteName.register);
                                  // }
                                  ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text.rich(TextSpan(
                            text: 'Already have an account yet? ',
                            children: [
                              TextSpan(
                                  text: 'Sign Up ',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: AppColor.blue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, AppRouteName.register);
                                    })
                            ])),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
