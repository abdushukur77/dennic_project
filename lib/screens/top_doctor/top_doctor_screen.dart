import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_event.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/blocs/doctor/doctor_state.dart';
import 'package:dennic_project/blocs/specialization/specialization_bloc.dart';
import 'package:dennic_project/blocs/specialization/specialization_state.dart';
import 'package:dennic_project/data/local/storage_repository.dart';
import 'package:dennic_project/screens/detail/detail_screen.dart';
import 'package:dennic_project/screens/specialist_doctor/specialist_doctor_screen.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/see_all_items.dart';
import 'package:dennic_project/screens/top_doctor/widgets/category_items.dart';
import 'package:dennic_project/screens/top_doctor/widgets/top_doctor_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../tab_box/home/widgets/doctor_logo.dart';
import '../tab_box/home/widgets/ring_and_favorite_items.dart';
import '../tab_box/home/widgets/textfield_items.dart';

class TopDoctorScreen extends StatefulWidget {
  const TopDoctorScreen({super.key});

  @override
  State<TopDoctorScreen> createState() => _TopDoctorScreenState();
}

class _TopDoctorScreenState extends State<TopDoctorScreen> {
  int activeIndex = -1;

  @override
  void initState() {
    Future.microtask(() => context.read<DoctorBloc>()..add(FetchDoctors()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            72.getH(),
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

            SizedBox(height: 20.h),
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
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryItems(
                          title: "All",
                          isSelected: activeIndex == -1,
                          onTap: () {
                            context.read<DoctorBloc>()..add(FetchDoctors());
                            activeIndex = -1;
                            setState(() {});
                          },
                        ),
                        ...List.generate(
                          state.specializations.length,
                              (index) {
                            return CategoryItems(
                              title: state.specializations[index].name,
                              isSelected: activeIndex == index,
                              onTap: () {
                                context.read<DoctorBloc>().add(
                                  FetchDoctorsBySpecialization(
                                    state.specializations[index].id,
                                  ),
                                );
                                activeIndex = index;
                                setState(() {});
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
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            children: [
                              ...List.generate(
                                state.searchDoctors.length,
                                    (index) {
                                  return TopDoctorItems(
                                    name: state.searchDoctors[index].firstName +
                                        " " +
                                        state.searchDoctors[index].lastName,
                                    description: state.searchDoctors[index].bio,
                                    rate: (4.7).toString(),
                                    review: 4692.toString(),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return DetailScreen(
                                              doctorModel: state.searchDoctors[index],
                                            );
                                          }));
                                    },
                                    favoriteTap: () {},
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
          ],
        ),
      ),
    );
  }
}
