import 'dart:convert';
import 'dart:io';
import 'package:dennic_project/data/model/update_user_model/update_user_model.dart';
import 'package:dennic_project/data/network/api_provider.dart';
import 'package:dennic_project/screens/tab_box/profile/edit_profile_screen/edit_profile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';
import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_event.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/blocs/doctor/doctor_bloc.dart';
import 'package:dennic_project/blocs/doctor/doctor_event.dart';
import 'package:dennic_project/blocs/doctor/doctor_state.dart';
import 'package:dennic_project/data/local/storage_repository.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/doctor_logo.dart';
import 'package:dennic_project/screens/tab_box/home/widgets/ring_and_favorite_items.dart';
import 'package:dennic_project/screens/tab_box/profile/widgets/avatar_item.dart';
import 'package:dennic_project/screens/tab_box/profile/widgets/listtile_items.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;

  @override
  void initState() {
    Future.microtask(() => context.read<DoctorBloc>()..add(GetUser()));
    super.initState();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: source, maxHeight: 60.h, maxWidth: 60.w);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
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

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      debugPrint(value);
    });

    if (response.statusCode == 201) {
      // debugPrint(request.url.toString());
      // print('Image uploaded successfully!');
      // context.read<DoctorBloc>()..add(GetUser());
    } else {
      context.read<DoctorBloc>()..add(GetUser());
      print('Image upload failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
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
            return Column(
              children: [
                50.getH(),
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
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                              return EditProfileScreen();
                            })),
                          ),
                          RingAndFavoriteItems(
                            icon: const Icon(Icons.edit),
                            onTap: () => _pickImage(ImageSource.gallery),
                          ),
                          RingAndFavoriteItems(
                            icon: const Icon(Icons.camera_alt),
                            onTap: () => _pickImage(ImageSource.camera),
                          ),
                        ],
                      ),
                      24.getH(),
                      Row(
                        children: [
                          _imageFile == null
                              ? AvatarItem(image: state.myUserModel.imageUrl)
                              : CircleAvatar(
                                  radius: 50.r,
                                  child: Image.file(
                                    _imageFile!,
                                    width: 100.w,
                                    height: 100.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          24.getW(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.myUserModel.firstName} ${state.myUserModel.lastName}',
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
                                  state.myUserModel.birthDate,
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 100.he()),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTileItems(
                          icon: const Icon(Icons.directions_boat_filled),
                          title: "Notification",
                          onTap: () async {
                            await ApiProvider.updateUser(
                                updateUserModel: UpdateUserModel(
                              birthDate: state.myUserModel.birthDate,
                              firstName: "Zokir",
                              gender: state.myUserModel.gender,
                              id: state.myUserModel.id,
                              imageUrl: state.myUserModel.imageUrl,
                              lastName: state.myUserModel.lastName,
                            ));
                            _uploadImage();
                            context.read<DoctorBloc>().add(GetUser());
                          },
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 12.h),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Are you sure"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel")),
                                        TextButton(
                                            onPressed: () {
                                              String token =
                                                  StorageRepository.getString(
                                                      key: "access_token");
                                              context.read<AuthBloc>().add(
                                                  LogOutUserEvent(
                                                      token: token));

                                              StorageRepository.setBool(
                                                  key: "is_new_user",
                                                  value: false);
                                            },
                                            child: const Text("OK")),
                                      ],
                                    );
                                  });
                            },
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
                              "Logout ",
                              style: TextStyle(
                                color: AppColors.c_09101D,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _uploadImage,
                          child: Text('Upload Image'),
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
