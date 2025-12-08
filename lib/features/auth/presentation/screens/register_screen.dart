import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes_manager/routes/app_route_name.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custoum_btn.dart';
import '../manager/auth_provider.dart';
import '../widgets/phone_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.blue),
          title: Text('Register' , style: TextStyle(
              color: AppColor.blue,
              fontSize: 24
          ),),),

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
                              'Create Account',
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
                              "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
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
                          controller: provider.nameController,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: AppColor.gray, width: 1)),
                              // prefixIcon: Icon(Icons.mail_outline),
                              hintText: 'Name',
                              hintStyle: TextStyle(color: AppColor.gray)),
                        ),
                        SizedBox(
                          height: 16,
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
                          height: 16,
                        ),
                        ValueListenableBuilder(
                          valueListenable: provider.password,
                          builder: (context, value , child) {
                            return TextFormField(
                              controller: provider.rePasswordController,
                              validator: (value) {
                                if(value != provider.passwordController.text){
                                  return 'Password Not Matched';
                                }else {
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
                                hintText: 'Re-Password',
                                hintStyle: TextStyle(color: AppColor.gray),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      provider.password.value =
                                      !provider.password.value;
                                    },
                                    child: Icon(provider.isShowPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        PhoneField(),
                        SizedBox(
                          height: 55,
                        ),
                        CustoumBtn(
                          // isLoading: provider.isLoading,
                          text: 'Create Account',
                          onTab: () {
                            provider.createAccount(context);
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
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () async {
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
                          height: 20,
                        ),
                        Text.rich(TextSpan(
                            text: 'Already have an account? ',
                            children: [
                              TextSpan(
                                  text: 'Login ',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: AppColor.blue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, AppRouteName.login);
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
