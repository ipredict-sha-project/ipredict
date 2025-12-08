import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipredict/features/auth/presentation/manager/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_color.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({super.key});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  String selectedCode = "+1"; // default

  final List<Map<String, String>> countryCodes = [
    {"name": "Egypt", "dial": "+20", "image": "assets/logos/Egypt.png"},
    {
      "name": "United States",
      "dial": "+1",
      "image": "assets/logos/United_States.png"
    },
    {
      "name": "Saudi Arabia",
      "dial": "+966",
      "image": "assets/logos/Saudi_Arabia.png"
    },
    {"name": "UAE", "dial": "+971", "image": "assets/logos/UAE.png"},
    {"name": "UK", "dial": "+44", "image": "assets/logos/UK.png"},
  ];

  String? getSelectedCountryLength() {
    return countryCodes.firstWhere((c) => c["dial"] == selectedCode)["length"];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Row(
            children: [
              // Country Code Dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.gray),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: DropdownButton<String>(
                  value: selectedCode,
                  underline: const SizedBox(),
                  items: countryCodes.map((country) {
                    return DropdownMenuItem(
                        value: country["dial"],
                        child: Image.asset(
                          "${country["image"]}",
                          width: 28,
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCode = value!;
                    });
                  },
                ),
              ),

              SizedBox(width: 10,),
              // Phone number TextField
              Expanded(
                child: TextFormField(
                    controller: provider.PhoneController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      hintStyle: TextStyle(color: AppColor.gray),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],

                    validator: (value) {
                      int requiredLength = getSelectedCountryLength() as int;

                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Numbers only are allowed';
                      }
                      if (value.length != requiredLength) {
                        return "Phone number must be $requiredLength digits";
                      }
                      return null;
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
