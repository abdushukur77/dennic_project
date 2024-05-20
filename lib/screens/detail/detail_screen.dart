import 'package:dennic_project/data/model/doctor_model/doctor_model.dart';
import 'package:dennic_project/screens/detail/widgets/day_items.dart';
import 'package:dennic_project/screens/detail/widgets/details_doctor_items.dart';
import 'package:dennic_project/screens/detail/widgets/patients_items.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/ring_and_favorite_items.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/see_all_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            80.getH(),
            Padding(
              padding: EdgeInsets.only(
                right: 24.w,
                left: 15.w,
              ),
              child: Row(
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
                  Expanded(
                    flex: 20,
                    child: Text(
                      widget.doctorModel.firstName +
                          " "  +
                          widget.doctorModel.lastName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.c_09101D,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  RingAndFavoriteItems(
                    icon: const Icon(Icons.favorite_border),
                    onTap: () {},
                  ),
                  10.getW(),
                  RingAndFavoriteItems(
                    icon: const Icon(Icons.share),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.getH(),
                  DetailsDoctorItems(
                    fullName: widget.doctorModel.firstName +
                        " " +
                        widget.doctorModel.lastName,
                    bio: widget.doctorModel.bio,
                  ),
                  24.getH(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        width: 1.w,
                        color: AppColors.c_2972FE,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PatientsItems(
                          icon: Icons.people,
                          title: "5000+",
                          subtitle: "Patients",
                        ),
                        PatientsItems(
                          icon: Icons.person,
                          title: "15+",
                          subtitle: "Years experiences",
                        ),
                        PatientsItems(
                          icon: Icons.message,
                          title: "3800+",
                          subtitle: "Reviews",
                        ),
                      ],
                    ),
                  ),
                  24.getH(),
                  Text(
                    "About Doctor",
                    style: TextStyle(
                      color: AppColors.c_2C3A4B,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.getH(),
                  Text(
                   widget.doctorModel.bio,
                    style: TextStyle(
                      color: AppColors.c_09101D,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  20.getH(),
                  Text(
                    "Working Time",
                    style: TextStyle(
                      color: AppColors.c_2C3A4B,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.getH(),
                  Text(
                    "Mon - Fri, 09.00 AM - 20.00 PM",
                    style: TextStyle(
                      color: AppColors.c_09101D,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  20.getH(),
                  Row(
                    children: [
                      Text(
                        "Reviews",
                        style: TextStyle(
                          color: AppColors.c_2C3A4B,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      SeeAllItems(
                        title: "See reviews",
                        onTap: () {},
                      ),
                    ],
                  ),
                  20.getH(),
                  Text(
                    "Make Appointment",
                    style: TextStyle(
                      color: AppColors.c_2C3A4B,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  12.getH(),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  24.getW(),
                  ...List.generate(
                    10,
                    (index) {
                      return DayItems(
                        title: titles[index],
                        subtitle: subtitles[index],
                        onTap: () {},
                      );
                    },
                  ),
                  12.getW(),
                ],
              ),
            ),
            25.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    backgroundColor: AppColors.c_2972FE,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            24.getH(),
          ],
        ),
      ),
    );
  }
}

List<String> titles = [
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
];

List<String> subtitles = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
];
