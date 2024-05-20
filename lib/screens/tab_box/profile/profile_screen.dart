import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/blocs/doctor/doctor_state.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/doctor_logo.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/ring_and_favorite_items.dart';
import 'package:dennic_project/screens/tab_box/profile/widgets/avatar_item.dart';
import 'package:dennic_project/screens/tab_box/profile/widgets/listtile_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/auth/auth_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<DoctorBloc>()..add(GetUser()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<DoctorBloc, DoctorState>(
        builder: (context, state) {
          if (state.formStatus == FormStatus.loading) {
            return CircularProgressIndicator();
          }
          if (state.formStatus == FormStatus.error) {
            return Text(state.errorMessage);
          }

          if (state.formStatus == FormStatus.success) {
            debugPrint("My User Model name${state.myUserModel.firstName}");
            return Column(
              children: [
                72.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const DoctorLogo(),
                          20.getW(),
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: AppColors.c_09101D,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          RingAndFavoriteItems(
                            icon: const Icon(Icons.edit),
                            onTap: () {},
                          ),
                        ],
                      ),
                      24.getH(),
                      Row(
                        children: [
                          const AvatarItem(),
                          24.getW(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.myUserModel.firstName+" "+ state.myUserModel.lastName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.c_09101D,
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.getH(),
                                Text(
                                  state.myUserModel.phoneNumber,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.c_545D69,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                4.getH(),
                                Text(
                                  state.myUserModel.gender,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.c_545D69,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                4.getH(),
                                Text(
                                  state.myUserModel.birthDate.substring(0,10),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.c_545D69,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      24.getH(),
                      Container(
                        width: double.infinity,
                        height: 1.h,
                        color: AppColors.c_EBEEF2,
                      ),
                    ],
                  ),
                ),
                8.getH(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 100.he()),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListTileItems(
                          icon: const Icon(Icons.directions_boat_filled),
                          title: "Notification",
                          onTap: () {},
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          width: double.infinity,
                          height: 1.h,
                          color: AppColors.c_EBEEF2,
                        ),
                        ListTileItems(
                          icon: const Icon(Icons.security),
                          title: "Security",
                          onTap: () {},
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          width: double.infinity,
                          height: 1.h,
                          color: AppColors.c_EBEEF2,
                        ),
                        ListTileItems(
                          icon: const Icon(Icons.remove_red_eye),
                          title: "Appearance",
                          onTap: () {},
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          width: double.infinity,
                          height: 1.h,
                          color: AppColors.c_EBEEF2,
                        ),
                        ListTileItems(
                          icon: const Icon(Icons.help),
                          title: "Help",
                          onTap: () {},
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          width: double.infinity,
                          height: 1.h,
                          color: AppColors.c_EBEEF2,
                        ),
                        ListTileItems(
                          icon: const Icon(Icons.people_alt_outlined),
                          title: "Invite Friends",
                          onTap: () {},
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          width: double.infinity,
                          height: 1.h,
                          color: AppColors.c_EBEEF2,
                        ),
                        16.getH(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: ListTile(
                            onTap: () {},
                            leading: Container(
                              height: 56.h,
                              width: 47.w,
                              decoration: BoxDecoration(
                                color: AppColors.c_FF1843.withOpacity(.1),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.login,
                                size: 25.sp,
                                color: AppColors.c_FF1843,
                              ),
                            ),
                            title: Text(
                              "Logout",
                              style: TextStyle(
                                color: AppColors.c_09101D,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
