import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

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
          "Terms and Condition",
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.c_09101D,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
              children: const [
                TextSpan(
                  text: '\t Welcome to Dennic system. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'These terms and conditions outline the rules and regulations for the use of our clinic’s services and website. By accessing or using our services, you accept these terms and conditions in full. Do not continue to use Dennic system if you do not agree to all of the terms and conditions stated on this page.\n\n',
                ),
                TextSpan(
                  text:
                      'Dennic system provides healthcare services, including a list of services. These services are provided subject to these terms and conditions. Appointments can be booked through our website, phone, or in person. Cancellations must be made at least 24 hours in advance. Late cancellations or no-shows may incur a fee.\n\n',
                ),
                TextSpan(
                  text:
                      'Fees for services are outlined in the clinic and on our website. All fees are subject to change. We accept [list payment methods]. Payment is due at the time of service unless other arrangements have been made.\n\n',
                ),
                TextSpan(
                  text:
                      'Patients are responsible for providing accurate and complete health information. They must inform us of any changes in their health condition. Your privacy is important to us. Please refer to our Privacy Policy for details on how we collect, use, and protect your information.\n\n',
                ),
                TextSpan(
                  text:
                      'Dennic system is not liable for any direct, indirect, incidental, or consequential damages that result from the use of our services. We reserve the right to modify these terms at any time. Changes will be posted on our website. Continued use of our services constitutes acceptance of the new terms.\n\n',
                ),
                TextSpan(
                  text:
                      'These terms are governed by and construed in accordance with the laws of Uzbekistan, and you submit to the non-exclusive jurisdiction of the state and federal courts located in [Your State/Country] for the resolution of any disputes. If you have any questions about these Terms and Conditions, please contact us at ',
                ),
                TextSpan(
                  text: 'mubinayigitaliyeva00@gmail.com',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(
                  text: ', +998972645292  or Najot Ta\'lim, Uzbekistan.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
