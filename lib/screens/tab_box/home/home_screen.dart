import 'dart:math';
import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../blocs/doctor/doctor_bloc.dart';
import '../../../blocs/doctor/doctor_state.dart';
import '../../../blocs/specialization/specialization_bloc.dart';
import '../../../blocs/specialization/specialization_state.dart';
import '../../detail/detail_screen.dart';

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
          physics: BouncingScrollPhysics(),
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SpecialistDoctorScreen();
                            }));
                          },
                          title: '',
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
                    return CircularProgressIndicator();
                  }
                  if (state.formStatus == FormStatus.error) {
                    return Text(state.errorMessage);
                  }
                  if (state.formStatus == FormStatus.success) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          24.getW(),
                          ...List.generate(
                            state.specializations.length,
                            (index) {
                              return SpecialistItems(
                                icon: state.specializations[index].imageUrl,
                                title: state.specializations[index].name,
                                subTitle: state.specializations[index].order.toString()+" doctors",
                                color1:generateRandomColors()[0],
                                onTap: () {
                                  // context.read<DoctorBloc>().add(
                                  //   FetchDoctorsBySpecialization(
                                  //     state.specializations[index].id,
                                  //   ),
                                  // );

                                },
                              );
                            },
                          ),
                          16.getW(),
                        ],
                      ),
                    );
                  }
                  return SizedBox();
                },
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TopDoctorScreen();
                        }));
                      },
                      title: '',
                    ),
                  ],
                ),
              ),
              24.getH(),
              BlocBuilder<DoctorBloc, DoctorState>(
                builder: (context, state) {
                  if (state.formStatus == FormStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.formStatus == FormStatus.error) {
                    return Text(state.errorMessage);
                  }
                  if (state.formStatus == FormStatus.success) {
                    return Column(
                      children: [
                        24.getH(),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              children: [
                                ...List.generate(
                                  state.doctors.length,
                                  (index) {
                                    return DoctorItems(
                                      image: AppImages.doctor,
                                      title: state.doctors[index].lastName,
                                      subtitle: state.doctors[index].bio,
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DetailScreen(
                                            doctorModel:
                                                state.doctors[index],
                                          );
                                        }));
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
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
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){

                          return TopDoctorScreen();
                        }));
                      },
                      title: '',
                    ),
                  ],
                ),
              ),
              120.getH(),
            ],
          ),
        ),
      ),
    );
  }
}

List<Color> generateRandomColors() {
  // Create a list of the given colors
  List<Color> colors = [
    Color(0xFFFF5E7C),
    Color(0xFFFFB800),
    Color(0xFF2972FE),
  ];

  // Create a random number generator
  Random random = Random();

  // Generate two random indices from the list
  int index1 = random.nextInt(colors.length);
  int index2 = random.nextInt(colors.length);

  // Ensure that the two indices are different
  while (index1 == index2) {
    index2 = random.nextInt(colors.length);
  }

  // Return a list of the two randomly chosen colors
  return [colors[index1], colors[index2]];
}

// SpecialistItems(
// icon: AppImages.favorite,
// title: "Cardio Specialist",
// subTitle: "252 Doctors",
// color1: AppColors.c_FF1843,
// color2: AppColors.c_FF5E7C,
// onTap: () {},
// ),
// SpecialistItems(
// icon: AppImages.favorite,
// title: "Dental Specialist",
// subTitle: "186 Doctors",
// color1: AppColors.c_2972FE,
// color2: AppColors.c_6499FF,
// onTap: () {},
// ),
// SpecialistItems(
// icon: AppImages.favorite,
// title: "Eye Specialist",
// subTitle: "201 Doctors",
// color1: AppColors.c_FFB800,
// color2: AppColors.c_FFDA7B,
// onTap: () {},
// ),
