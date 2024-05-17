import 'package:dennic_project/screens/home/widgets/ring_and_favorite_items.dart';
import 'package:dennic_project/screens/home/widgets/textfield_items.dart';
import 'package:dennic_project/screens/top_doctor/widgets/category_items.dart';
import 'package:dennic_project/screens/top_doctor/widgets/top_doctor_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopDoctorScreen extends StatefulWidget {
  const TopDoctorScreen({super.key});

  @override
  State<TopDoctorScreen> createState() => _TopDoctorScreenState();
}

class _TopDoctorScreenState extends State<TopDoctorScreen> {
  int activeIndex = 0;

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
                      "Top Doctor",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                24.getW(),
                ...List.generate(
                  5,
                  (index) {
                    return CategoryItems(
                      title: categories[index],
                      isSelected: activeIndex == index,
                      onTap: () {
                        activeIndex = index;
                        setState(() {});
                      },
                    );
                  },
                ),
                16.getW(),
              ],
            ),
          ),
          24.getH(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    ...List.generate(
                      10,
                      (index) {
                        return TopDoctorItems(
                          name: "Dr. Ralph Edwards",
                          description:
                              "Cardio Specialist -  Ramsay College  Hospital",
                          rate: (4.7).toString(),
                          review: 4692.toString(),
                          onTap: () {},
                          favoriteTap: () {},
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24.sp,
                    color: AppColors.c_2972FE,
                  ),
                ),
                const Expanded(
                  child: TextFieldItems(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<String> categories = [
  "All",
  "Brain",
  "Cardio",
  "Eye",
  "Dentist",
];
