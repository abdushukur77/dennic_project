import 'package:dennic_project/screens/home/widgets/ring_and_favorite_items.dart';
import 'package:dennic_project/screens/specialist_doctor/widgets/specialist_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistDoctorScreen extends StatefulWidget {
  const SpecialistDoctorScreen({super.key});

  @override
  State<SpecialistDoctorScreen> createState() => _SpecialistDoctorScreenState();
}

class _SpecialistDoctorScreenState extends State<SpecialistDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                72.getH(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        size: 24.sp,
                        color: AppColors.c_2972FE,
                      ),
                    ),
                    10.getW(),
                    Text(
                      "Specialist Doctor",
                      style: TextStyle(
                        color: AppColors.c_09101D,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    RingAndFavoriteItems(
                      icon: AppImages.lock,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          24.getH(),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              crossAxisCount: 2,
              childAspectRatio: 0.96,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 24.h,
              children: [
                ...List.generate(
                  20,
                  (index) {
                    return SpecialistScreenItems(
                      icon: AppImages.favorite,
                      title: "Cardio Specialist",
                      subtitle: "252 Doctors",
                      color1: AppColors.c_FF1843,
                      color2: AppColors.c_FF5E7C,
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
