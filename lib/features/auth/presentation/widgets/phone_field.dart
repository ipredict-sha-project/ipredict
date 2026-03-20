import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_color.dart';
import '../../data/data_source/auth_provider.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return IntlPhoneField(
          controller: provider.phoneController,
          initialCountryCode: 'EG',
          decoration: InputDecoration(
            hintText: "Phone Number",
            hintStyle: TextStyle(color: AppColor.gray),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          dropdownIconPosition: IconPosition.trailing,
          onChanged: (phone) {
            // full number + country code
            provider.fullPhoneNumber = phone.completeNumber;
          },
          validator: (phone) {
            if (phone == null || phone.number.isEmpty) {
              return 'Enter phone number';
            }
            if (!phone.isValidNumber()) {
              return 'Invalid phone number';
            }
            return null;
          },
        );
      },
    );
  }
}
