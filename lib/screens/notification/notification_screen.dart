import 'package:dennic_project/screens/notification/widgets/notification_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              72.getH(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24.sp,
                      color: AppColors.c_2972FE,
                    ),
                  ),
                  20.getW(),
                  Text(
                    "Notification",
                    style: TextStyle(
                      color: AppColors.c_09101D,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              24.getH(),
              Text(
                "Today, March 25 2022",
                style: TextStyle(
                  color: AppColors.c_2C3A4B,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              24.getH(),
              ...List.generate(
                10,
                (index) {
                  return const NotificationItems(
                    title: "Appointment Alarm",
                    subtitle:
                        "Your appointment will be start after 15 minutes. Stay with app and take care.",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
