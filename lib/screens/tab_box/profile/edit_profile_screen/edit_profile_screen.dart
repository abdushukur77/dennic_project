import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/data/model/user_info/my_user_model.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/doctor_logo.dart';
import 'package:dennic_project/screens/tab_box/profile/edit_profile_screen/widgets/date_time_picker.dart';
import 'package:dennic_project/screens/tab_box/profile/edit_profile_screen/widgets/full_name.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../data/model/update_user_model/update_user_model.dart';
import 'widgets/next_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.myUserModel});

  final MyUserModel myUserModel;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<DoctorBloc>()..add(GetUser()));
    super.initState();

    firstNameController.text = widget.myUserModel.firstName;
    lastNameController.text = widget.myUserModel.lastName;
    phoneController.text = widget.myUserModel.phoneNumber;
    genderController.text = widget.myUserModel.gender;
    dateController.text = widget.myUserModel.birthDate;
    selectedDate=DateTime.parse(widget.myUserModel.birthDate);
  }

  DateTime? selectedDate;
  String gender = 'male';

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const List<String> list = [
      "male",
      "female",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const DoctorLogo(),
            SizedBox(width: 20.w),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.c_09101D,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      // Align the Positioned widget correctly
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage: NetworkImage(
                              widget.myUserModel.imageUrl,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 100.w,
                          // Adjust the right position to align the edit icon
                          bottom: 0,
                          // Adjust the bottom position to align the edit icon
                          child: Container(
                            padding: EdgeInsets.only(right: 5.w, bottom: 5.h),
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.c_2972FE,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Divider(thickness: 1),
                    SizedBox(height: 24.h),
                    FullNameInput(
                      nameController: firstNameController,
                      title: 'First Name',
                      enabled: true,
                    ),
                    SizedBox(height: 24.h),
                    FullNameInput(
                      nameController: lastNameController,
                      title: 'Last Name',
                      enabled: true,
                    ),
                    SizedBox(height: 24.h),
                    FullNameInput(
                      nameController: phoneController,
                      title: "Phone Number",
                      enabled: false,
                    ),
                    SizedBox(height: 24.h),
                    CustomDropdown<String>(
                      items: list,
                      initialItem: genderController.text,
                      onChanged: (value) {
                        setState(() {});
                        gender = value;
                        debugPrint("GENDER ${value}");
                        genderController.text=value;
                      },
                    ),
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                        setState(() {});
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          prefixIcon: SvgPicture.asset(
                            AppImages.calendar,
                            width: 7.w,
                            height: 7.h,
                          ),
                          // border: OutlineInputBorder(),
                        ),
                        child: selectedDate != null
                            ? Text(
                          selectedDate.toString().substring(0, 10),
                          style: AppTextStyle.urbanistBold
                              .copyWith(color: AppColors.c7E8CA0),
                        )
                            : Text(widget.myUserModel.birthDate),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
            NextButton(
              onPressed: () async {
                debugPrint("Dateee ----------------${selectedDate.toString().substring(0, 10)}");

                await ApiProvider.updateUser(
                  updateUserModel: UpdateUserModel(
                    birthDate: selectedDate.toString().substring(0, 10),
                    firstName: firstNameController.text,
                    gender: gender,
                    id: widget.myUserModel.id,
                    imageUrl: widget.myUserModel.imageUrl,
                    lastName: lastNameController.text,
                  ),
                );
                context.read<DoctorBloc>().add(GetUser());
                Navigator.pop(context);
              },
              title: 'Update',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
