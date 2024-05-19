import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/local/storage_repository.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:dennic_project/screens/register_and_login/sign_in/sign_in_screen.dart';
import 'package:dennic_project/screens/specialist_doctor/specialist_doctor_screen.dart';

import 'package:dennic_project/screens/tab_box/home/widgets/doctor_items.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/doctor_logo.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/ring_and_favorite_items.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/see_all_items.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/specialist_items.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/textfield_items.dart';
import 'package:dennic_project/screens/top_doctor/top_doctor_screen.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/auth/auth_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.statusMessage == "logout") {
          print("Tokennnnnnn ${state.userToken}");
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const SignInScreen();
            },
          ));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              68.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const DoctorLogo(),
                        20.getW(),
                        Text(
                          "Dennic",
                          style: AppTextStyle.urbanistMedium.copyWith(
                            color: AppColors.c_2C3A4B,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        RingAndFavoriteItems(
                          icon: const Icon(Icons.add_alert_sharp,
                              color: AppColors.c_2972FE),
                          onTap: () {},
                        ),
                        16.getW(),
                        RingAndFavoriteItems(
                          icon: const Icon(
                            Icons.favorite,
                            color: AppColors.c_2972FE,
                          ),
                          onTap: () {
                            String token =
                                StorageRepository.getString(key: "access_token");
                            debugPrint(token);
                            context
                                .read<AuthBloc>()
                                .add(LogOutUserEvent(token: token));

                            StorageRepository.setBool(key: "is_new_user", value: false);
                          },
                        ),
                      ],
                    ),
                    26.getH(),
                    const TextFieldItems(),
                    24.getH(),
                    Row(
                      children: [
                        Text("Specialist Doctor",
                            style: AppTextStyle.urbanistMedium.copyWith(
                              color: AppColors.c_2C3A4B,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            )),
                        const Spacer(),
                        SeeAllItems(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){

                              return SpecialistDoctorScreen();
                            }));
                          },
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
                    SpecialistItems(
                      icon: AppImages.favorite,
                      title: "Cardio Specialist",
                      subTitle: "252 Doctors",
                      color1: AppColors.c_FF1843,
                      color2: AppColors.c_FF5E7C,
                      onTap: () {},
                    ),
                    SpecialistItems(
                      icon: AppImages.favorite,
                      title: "Dental Specialist",
                      subTitle: "186 Doctors",
                      color1: AppColors.c_2972FE,
                      color2: AppColors.c_6499FF,
                      onTap: () {},
                    ),
                    SpecialistItems(
                      icon: AppImages.favorite,
                      title: "Eye Specialist",
                      subTitle: "201 Doctors",
                      color1: AppColors.c_FFB800,
                      color2: AppColors.c_FFDA7B,
                      onTap: () {},
                    ),
                    8.getW(),
                  ],
                ),
              ),
              24.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Text(
                      "Top Doctor",
                      style: TextStyle(
                        color: AppColors.c_2C3A4B,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    SeeAllItems(
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context){

                          return TopDoctorScreen();
                        }));
                      },
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
                    DoctorItems(
                      image: AppImages.doctor,
                      title: "Dr. Jerome Bell",
                      subtitle: "Cardio Specialist",
                      onTap: () {},
                    ),
                    DoctorItems(
                      image: AppImages.doctor,
                      title: "Dr. Jenny Wilson",
                      subtitle: "Dental Specialist",
                      onTap: () {},
                    ),
                    DoctorItems(
                      image: AppImages.doctor,
                      title: "Dr. Dianne Russell",
                      subtitle: "Eye Specialist",
                      onTap: () {},
                    ),
                    8.getW(),
                  ],
                ),
              ),
              24.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Text(
                      "Recommendation",
                      style: TextStyle(
                        color: AppColors.c_2C3A4B,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    SeeAllItems(
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              24.getH(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ApiProvider.fetchDoctors();
          },
        ),
      ),
    );
  }
}
