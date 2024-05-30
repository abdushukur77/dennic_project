import 'package:dennic_project/screens/tab_box/profile/screens/contact_us_screen.dart';
import 'package:dennic_project/screens/tab_box/profile/screens/faq_screen.dart';
import 'package:dennic_project/screens/tab_box/profile/screens/privacy_policy_screen.dart';
import 'package:dennic_project/screens/tab_box/profile/screens/terms_conditions_screen.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({super.key});

  final List<Map<String, dynamic>> pages = [
    {
      'title': "FAQ",
      'route': const FaqScreen(),
    },
    {
      'title': "Contact Us",
      'route': const ContactUsScreen(),
    },
    {
      'title': "Terms & Conditions",
      'route': const TermsConditionsScreen(),
    },
    {
      'title': "Privacy Polics",
      'route': const PrivacyPolicyScreen(),
    }
  ];
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
          "Help",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.c_09101D,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            for (var page in pages)
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return page['route'];
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            page['title'],
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.5.h,
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: <Color>[
                                  AppColors.c_2972FE,
                                  AppColors.c_6499FF
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.c_EBEEF2,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
