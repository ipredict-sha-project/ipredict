import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ipredict/core/theme/app_color.dart';

import '../../../../../../core/widget/custoum_btn.dart';
import '../../../widgets/appbar_widget.dart';

class DevicesTab extends StatefulWidget {
  const DevicesTab({super.key});

  @override
  State<DevicesTab> createState() => _DevicesTabState();
}

class _DevicesTabState extends State<DevicesTab> {
  // Controllers عشان نمسك الكلام اللي المستخدم بيكتبه
  final TextEditingController deviceIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ده عشان نتكلم مع Firebase
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // عشان نعرض loading لما بنحفظ
  bool isLoading = false;

  // الفنكشن اللي بتحفظ البيانات في Firebase
  Future<void> addDeviceToFirebase() async {
    // لو الخانات فاضية، نعرض رسالة
    if (deviceIdController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('من فضلك املأ جميع الحقول'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      // نتأكد الأول إن الجهاز مش موجود
      final querySnapshot = await firestore
          .collection('devices')
          .where('deviceId', isEqualTo: deviceIdController.text.trim())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // لو الجهاز موجود، نوقف ونعرض رسالة
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('هذا الجهاز موجود بالفعل! ⚠️'),
            backgroundColor: Colors.orange,
          ),
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      // لو مش موجود، نضيفه عادي
      await firestore.collection('devices').add({
        'deviceId': deviceIdController.text.trim(),
        'password': passwordController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      // لو نجح الحفظ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم إضافة الجهاز بنجاح ✅'),
          backgroundColor: Colors.green,
        ),
      );

      // نفضّي الخانات
      deviceIdController.clear();
      passwordController.clear();
    } catch (e) {
      // لو حصل مشكلة
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    deviceIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidget(),
              SizedBox(height: 40),
              Text(
                "Select Device",
                style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 236,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.gray.withValues(alpha: 0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                  color: AppColor.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/scan.png"),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Scan QR Code",
                      style: TextStyle(
                        color: Color(0xff6C757D),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // خانة Device ID
                    TextFormField(
                      controller: deviceIdController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColor.gray, width: 1),
                        ),
                        hintText: 'Device ID',
                        hintStyle: TextStyle(color: AppColor.gray),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.gray),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        fillColor: AppColor.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    // خانة Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColor.gray, width: 1),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: AppColor.gray),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.gray),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        fillColor: AppColor.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    // الزرار - لو بنحفظ نعرض loading
                    isLoading
                        ? CircularProgressIndicator()
                        : CustoumBtn(
                            text: 'Add Device',
                            onTab: addDeviceToFirebase,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
