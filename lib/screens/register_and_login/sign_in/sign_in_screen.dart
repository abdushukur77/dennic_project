import 'package:dennic_project/blocs/auth/auth_bloc.dart';
import 'package:dennic_project/blocs/auth/auth_event.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/model/login_model/login_model.dart';
import 'package:dennic_project/screens/register_and_login/forgot_password/forget_password.dart';
import 'package:dennic_project/screens/register_and_login/sign_up/sign_up_screen.dart';
import 'package:dennic_project/screens/register_and_login/widget/my_text_from.dart';
import 'package:dennic_project/screens/tab_box/tab_box_screen.dart';
import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/constants/app_constants.dart';
import 'package:dennic_project/utils/formatter/input_formatter.dart';
import 'package:dennic_project/utils/images/app_images.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/local/storage_repository.dart';
import '../widget/my_text_from_tel.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obthorText = true;
  bool _loading = false;
  bool reversAnimation = false;

  final formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.we()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                96.getH(),
                Text(
                  "Welcome Back!",
                  style: AppTextStyle.urbanistBold.copyWith(
                    color: AppColors.c1D1E25,
                    fontSize: 24.sp,
                  ),
                ),
                8.getH(),
                Text(
                  "Sign In to your account",
                  style: AppTextStyle.urbanistRegular.copyWith(
                    color: AppColors.c68DBFF,
                    fontSize: 16.sp,
                  ),
                ),
                70.getH(),
                MyTextFromFieldTel(
                  // regExp: AppConstants.phoneRegExp,
                  errorText: 'Phone number error',
                  controller: phoneNumberController,
                  labelText: 'Type your phone',
                  perefixIcon: AppImages.call,
                  valueChanged: (String value) {
                    setState(() {});
                  },
                  inputFormatter: AppInputFormatters.phoneFormatter,
                ),
                30.getH(),
                MyTextFromField(
                  errorText: 'Password error',
                  regExp: AppConstants.passwordRegExp,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  onTab: () {
                    setState(() {
                      obthorText = !obthorText;
                    });
                  },
                  labelText: 'Type your password',
                  perefixIcon: AppImages.lock,
                  obzorText: obthorText,
                  suffixIcon:
                      obthorText ? AppImages.openEye : AppImages.closeEye,
                  valueChanged: (String value) {
                    // debugPrint(value);

                    setState(() {});
                  },
                ),
                16.getH(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ForgetPassword();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: AppTextStyle.urbanistBold.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.c257CFF,
                      ),
                    ),
                  ),
                ),
                73.getH(),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r)),
                        backgroundColor: AppColors.c257CFF,
                        padding: EdgeInsets.symmetric(vertical: 15.he())),
                    onPressed: () {
                      debugPrint(
                          "BBBBBBBBB ${phoneNumberController.text.toString().replaceAll(" ", "")}");
                      _loading = true;
                      setState(() {});
                      LoginModel loginModel = LoginModel(
                        fcmToken: "asdfasdfsaf",
                        password: passwordController.text,
                        phoneNumber: phoneNumberController.text
                            .toString()
                            .replaceAll(" ", ""),
                        platformName: "mobile",
                        platformType: "mobile",
                      );

                      context.read<AuthBloc>().add(
                            LoginUserEvent(
                              loginModel: loginModel,
                            ),
                          );
                    },
                    child: _loading
                        ? Center(
                            child: SizedBox(
                              width: 25.we(),
                              height: 25.he(),
                              child: const CircularProgressIndicator.adaptive(),
                            ),
                          )
                        : Text(
                            "Sign In",
                            style: AppTextStyle.urbanistBold.copyWith(
                              fontSize: 14.sp,
                              color: AppColors.cFFFFFF,
                            ),
                          ),
                  ),
                ),
                27.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have account?",
                      style: AppTextStyle.urbanistRegular.copyWith(
                        fontSize: 14.sp,
                        color: const Color(0xFF9CA3AF),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up ",
                        style: AppTextStyle.urbanistBold.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.c257CFF,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state.formStatus == FormStatus.success) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignInScreen();
                },
              ),
            );
          }

          if (state.formStatus == FormStatus.error) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                _loading = false;
                return AlertDialog(
                  title: Text(state.errorText),
                );
              },
            );
          }

          if (state.statusMessage == "logged") {
            debugPrint("${state.statusMessage == 'logged'}  ");
            StorageRepository.setBool(
              key: "is_new_user",
              value: true,
            ).then(
              (value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const TabBoxScreen();
                  }),
                );
              },
            );
          }
          bool a = StorageRepository.getBool(
            key: "is_new_user",
          );
          debugPrint("$a WWWWWWWWWWWWWWWWWWWWWWWWWW");
        },
      ),
    );
  }
}

late AnimationController globalAnimationController;
