import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: <Color>[AppColors.c_2972FE, AppColors.c_6499FF],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.c_09101D,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
              children: const [
                TextSpan(
                  text:
                      '\t Dennic system is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and disclose information about you when you use our services. We collect personal information such as name, contact details, health information, and payment information when you use our services. We also collect information on how our services are accessed and used, including IP addresses, browser type, and pages visited.\n\n',
                ),
                TextSpan(
                  text:
                      'We use your information to provide and improve our healthcare services. We may use your contact information to send you updates and important information about your health and appointments. We use your information to process payments and manage billing.\n\n',
                ),
                TextSpan(
                  text:
                      'We do not share your personal information with third parties except with your consent, when required by law or to protect our legal rights, and with service providers who assist us in providing our services under strict confidentiality agreements.\n\n',
                ),
                TextSpan(
                  text:
                      'We take reasonable measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is completely secure. You have the right to access and correct your personal information. You may withdraw your consent for us to use your personal information at any time.\n\n',
                ),
                TextSpan(
                  text:
                      'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on our website. If you have any questions about this Privacy Policy, please contact us at ',
                ),
                TextSpan(
                  text: 'mubinayigitaliyeva00@gmail.com',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(
                  text: ', +998972645292, or Najot Ta\'lim, Uzbekistan.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
