import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/blocs/doctor/doctor_state.dart';
import 'package:dennic_project/data/model/appointment/appointment_model.dart';
import 'package:dennic_project/screens/detail/widgets/day_items.dart';
import 'package:dennic_project/screens/detail/widgets/details_doctor_items.dart';
import 'package:dennic_project/screens/detail/widgets/global_button.dart';
import 'package:dennic_project/screens/detail/widgets/patients_items.dart';
import 'package:dennic_project/screens/detail/widgets/share_items.dart';
import 'package:dennic_project/screens/global_widget/shimer_widget.dart';
import 'package:dennic_project/screens/tab_box/appointment/appointment_table_screen.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/ring_and_favorite_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.doctorId});

  final String doctorId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int activeIndex = 0;
  AppointmentModel appointmentModel = AppointmentModel.initial();

  @override
  void initState() {
    context.read<DoctorBloc>().add(FetchDoctorById(widget.doctorId));
    debugPrint("Qosimjon  ${widget.doctorId}");

    context.read<DoctorBloc>().add(GetDate());
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
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  20,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: ShimmerWidget(
                      border: BorderRadius.circular(12.r),
                      width: 169.w,
                      height: 229.h,
                    ),
                  ),
                ),
              ),
            );
          }
          if (state.formStatus == FormStatus.error) {
            return Text(state.errorMessage);
          }
          if (state.formStatus == FormStatus.success) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                                  "${state.doctorModel.firstName} ${state.doctorModel.lastName}",
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
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          left: 24.w,
                                          bottom: 48.h,
                                          right: 24.w,
                                        ),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40.r),
                                            topRight: Radius.circular(40.r),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            8.getH(),
                                            Container(
                                              width: 38.w,
                                              height: 3.h,
                                              color: AppColors.c_EBEEF2,
                                            ),
                                            24.getH(),
                                            Text(
                                              "Share",
                                              style: TextStyle(
                                                color: AppColors.c_2C3A4B,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            24.getH(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ShareItems(
                                                  icon: AppImages.whatsapp,
                                                  onTap: () {},
                                                ),
                                                ShareItems(
                                                  icon: AppImages.twitter,
                                                  onTap: () {},
                                                ),
                                                ShareItems(
                                                  icon: AppImages.facebook,
                                                  onTap: () {},
                                                ),
                                                ShareItems(
                                                  icon: AppImages.instagram,
                                                  onTap: () {},
                                                ),
                                              ],
                                            ),
                                            24.getH(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ShareItems(
                                                  icon: AppImages.yahoo,
                                                  onTap: () {},
                                                ),
                                                ShareItems(
                                                  icon: AppImages.tiktok,
                                                  onTap: () {},
                                                ),
                                                ShareItems(
                                                  icon: AppImages.chat,
                                                  onTap: () {},
                                                ),
                                                ShareItems(
                                                  icon: AppImages.wechat,
                                                  onTap: () {},
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
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
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FullscreenImageScreen(
                                        imageUrl: state.doctorModel.imageUrl,
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return CupertinoFullscreenDialogTransition(
                                          primaryRouteAnimation: animation,
                                          secondaryRouteAnimation:
                                              secondaryAnimation,
                                          linearTransition: true,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                fullName:
                                    "${state.doctorModel.firstName} ${state.doctorModel.lastName}",
                                bio: state.doctorModel.bio,
                                image: state.doctorModel.imageUrl,
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    PatientsItems(
                                      icon: Icons.people,
                                      title: state.doctorModel.patientCount
                                          .toString(),
                                      subtitle: "Patients",
                                    ),
                                    PatientsItems(
                                      icon: Icons.person,
                                      title: "${state.doctorModel.workYears}+",
                                      subtitle: "Years experiences",
                                    ),
                                    PatientsItems(
                                      icon: Icons.location_on_rounded,
                                      title: state.doctorModel.country,
                                      subtitle: "Country",
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
                                state.doctorModel.bio,
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
                                "Mon - Fri, ${state.doctorModel.startTime} AM - ${state.doctorModel.finishTime} PM",
                                style: TextStyle(
                                  color: AppColors.c_09101D,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
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
                                state.dateModels.length,
                                (index) {
                                  return DayItems(
                                    title: state.dateModels[index].week
                                        .substring(0, 3),
                                    subtitle:
                                        state.dateModels[index].date.substring(
                                      state.dateModels[index].date.length - 2,
                                      state.dateModels[index].date.length,
                                    ),
                                    isSelected: activeIndex == index,
                                    onTap: () {
                                      setState(()  {
                                       appointmentModel= appointmentModel.copyWith(
                                          appointmentDate: state.dateModels[index].date,
                                        );
                                        activeIndex = index;
                                      });
                                    },
                                  );
                                },
                              ),
                              12.getW(),
                            ],
                          ),
                        ),
                        25.getH(),
                      ],
                    ),
                  ),
                ),
                GlobalButton(
                  title: "Book Appointment",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AppointmentScreen(
                            doctorModel: state.doctorModel,
                            appointmentModel: appointmentModel,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class FullscreenImageScreen extends StatelessWidget {
  final String imageUrl;

  const FullscreenImageScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          SizedBox(height: 40.h),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 500.h,
            ),
          )
        ],
      ),
    );
  }
}
