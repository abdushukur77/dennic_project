import 'dart:convert';
import 'dart:io';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/data/model/update_user_model/update_user_model.dart';
import 'package:dennic_project/data/model/user_info/my_user_model.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/doctor_logo.dart';
import 'package:dennic_project/screens/tab_box/profile/edit_profile_screen/widgets/full_name.dart';
import 'package:dennic_project/screens/tab_box/profile/widgets/avatar_item.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'widgets/next_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.myUserModel});

  final MyUserModel myUserModel;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _imageFile;
  DateTime? selectedDate;
  String gender = 'male';
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String imageUrl = "";

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<DoctorBloc>()..add(GetUser()));

    firstNameController.text = widget.myUserModel.firstName;
    lastNameController.text = widget.myUserModel.lastName;
    phoneController.text = widget.myUserModel.phoneNumber;
    genderController.text = widget.myUserModel.gender;
    dateController.text = widget.myUserModel.birthDate;
    selectedDate = DateTime.parse(widget.myUserModel.birthDate);
    imageUrl = widget.myUserModel.imageUrl;
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://swag.dennic.uz/v1/file-upload?bucketName=user'),
    );

    request.files.add(
      http.MultipartFile(
        'file',
        _imageFile!.readAsBytes().asStream(),
        _imageFile!.lengthSync(),
        filename: path.basename(_imageFile!.path),
        contentType: MediaType('image', 'png'),
      ),
    );

    final response = await request.send();

    if (response.statusCode == 201) {
      response.stream.transform(utf8.decoder).listen((value) async {
        final Map<String, dynamic> responseData = json.decode(value);
        imageUrl = responseData['url'];

        debugPrint("Image Url______________________________ ${imageUrl}");

        await ApiProvider.updateUser(
          updateUserModel: UpdateUserModel(
            birthDate: selectedDate.toString().substring(0, 10),
            firstName: firstNameController.text,
            gender: gender,
            id: widget.myUserModel.id,
            imageUrl: imageUrl,
            lastName: lastNameController.text,
          ),
        );
        context.read<DoctorBloc>().add(GetUser());
      });
    } else {
      debugPrint('Image upload failed with status: ${response.statusCode}');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: source, maxHeight: 1024.h, maxWidth: 1024.w);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
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

  @override
  Widget build(BuildContext context) {
    const List<String> list = ["male", "female"];
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
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage:
                                NetworkImage(widget.myUserModel.imageUrl),
                          ),
                        ),
                        Positioned(
                          right: 100.w,
                          bottom: 0,
                          child: _imageFile == null
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            FullscreenImageScreen(
                                          imageUrl: widget.myUserModel.imageUrl,
                                        ),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          return CupertinoFullscreenDialogTransition(
                                            primaryRouteAnimation: animation,
                                            secondaryRouteAnimation:
                                                secondaryAnimation,
                                            child: child,
                                            linearTransition: true,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: AvatarItem(
                                    image: widget.myUserModel.imageUrl,
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 24.w,
                                              vertical: 14.h,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(40.r),
                                                topRight: Radius.circular(40.r),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ListTile(
                                                  onTap: () async {
                                                    await _pickImage(
                                                        ImageSource.camera);
                                                    _uploadImage();
                                                  },
                                                  leading: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.camera_alt_outlined,
                                                      size: 24.sp,
                                                      color: AppColors.c_2972FE,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    "Camera",
                                                    style: TextStyle(
                                                      color: AppColors.c_2972FE,
                                                      fontSize: 24.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                ListTile(
                                                  onTap: () async {
                                                    await _pickImage(
                                                        ImageSource.gallery);
                                                    _uploadImage();
                                                  },
                                                  leading: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.image_search,
                                                      size: 24.sp,
                                                      color: AppColors.c_2972FE,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    "Images",
                                                    style: TextStyle(
                                                      color: AppColors.c_2972FE,
                                                      fontSize: 24.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                )
                              : Stack(
                                  children: [
                                    CircleAvatar(
                                      maxRadius: 50.r,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        child: Image.file(
                                          _imageFile!,
                                          width: 100.w,
                                          height: 100.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        onTap: () {},
                                        child: Container(
                                          width: 23.w,
                                          height: 20.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.c_2972FE,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            size: 13.sp,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                        setState(() {
                          gender = value;
                          genderController.text = value;
                        });
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
                        ),
                        child: selectedDate != null
                            ? Text(
                                selectedDate.toString().substring(0, 10),
                                style: AppTextStyle.urbanistBold.copyWith(
                                  color: AppColors.c7E8CA0,
                                ),
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
                await ApiProvider.updateUser(
                  updateUserModel: UpdateUserModel(
                    birthDate: selectedDate.toString().substring(0, 10),
                    firstName: firstNameController.text,
                    gender: gender,
                    id: widget.myUserModel.id,
                    imageUrl: imageUrl,
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
}

class FullscreenImageScreen extends StatelessWidget {
  final String imageUrl;

  const FullscreenImageScreen({required this.imageUrl});

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
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  ))),
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
