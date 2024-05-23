import 'package:dennic_project/blocs/specialization/specialization_bloc.dart';
import 'package:dennic_project/blocs/specialization/specialization_state.dart';
import 'package:dennic_project/screens/specialist_doctor/widgets/specialist_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/auth/auth_state.dart';
import '../tab_box/home/home_screen.dart';
import '../tab_box/home/widgets/ring_and_favorite_items.dart';

class SpecialistDoctorScreen extends StatefulWidget {
  const SpecialistDoctorScreen({super.key});

  @override
  State<SpecialistDoctorScreen> createState() => _SpecialistDoctorScreenState();
}

class _SpecialistDoctorScreenState extends State<SpecialistDoctorScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                50.getH(),
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
                    10.getW(),
                    Text("Specialist Doctor",
                        style: AppTextStyle.urbanistMedium.copyWith(
                          color: AppColors.c_2C3A4B,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600,
                        )),
                    const Spacer(),
                    RingAndFavoriteItems(
                      icon: Icon(Icons.menu, color: AppColors.c_2972FE),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          24.getH(),
          BlocBuilder<SpecializationBloc, SpecializationState>(
            builder: (context, state) {
              if (state.formStatus == FormStatus.loading) {
                return const CircularProgressIndicator();
              }
              if (state.formStatus == FormStatus.error) {
                return Text(state.errorMessage);
              }
              if (state.formStatus == FormStatus.success) {
                return Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 10.h),
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 24.h,
                    children: [
                      ...List.generate(
                        state.specializations.length,
                            (index) {
                          return SpecialistScreenItems(
                            icon: state.specializations[index].imageUrl,
                            title: state.specializations[index].name,
                            subtitle: state.specializations[index].order.toString(),
                            color1: generateRandomColors(index+1)[0],
                            onTap: () {


                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
