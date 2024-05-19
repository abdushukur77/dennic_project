import 'dart:async';
import 'package:dennic_project/blocs/auth/auth_event.dart';
import 'package:dennic_project/blocs/auth/auth_state.dart';
import 'package:dennic_project/data/model/user_model/user_model.dart';
import 'package:dennic_project/data/model/verify_model/verify_model.dart';
import 'package:dennic_project/screens/register_and_login/verified/verified.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../blocs/auth/auth_bloc.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> animationAlign;
  late AnimationController animationController;
  String pinCode = "";
  List<String> list = [];
  int _start = 60;
  late Timer _timer;
  bool visibleRestart = false;
  bool error = false;
  bool reversAnimation = false;

  @override
  void initState() {
    startTimer();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animationAlign = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.center, end: Alignment.centerLeft),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerLeft, end: Alignment.center),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerRight, end: Alignment.center),
          weight: 40),
    ]).animate(
        CurvedAnimation(parent: animationController, curve: Curves.decelerate));

    animationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            visibleRestart = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget buttonItems({required String title}) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 28.w,
          vertical: 8.h,
        ),
        backgroundColor: Colors.white10,
      ),
      onPressed: () {
        if (pinCode.length < 4) {
          list = [];
          pinCode += title;
          list = pinCode.split('');
          if (pinCode.length == 4) {
            if (pinCode == "7777") {
              context.read<AuthBloc>().add(
                    AuthRequestPassword(
                      verifyModel: VerifyModel(
                        code: 7777,
                        fcmToken: 'aaaaaadvdaa',
                        phoneNumber: widget.userModel.phoneNumber,
                        platformName: 'Samsung',
                        platformType: 'mobile',
                      ),
                    ),
                  );
            } else {
              pinCode = "";
              list.clear();
              error = true;
            }
            if (reversAnimation) {
              animationController.reverse();
              reversAnimation = false;
            } else {
              animationController.forward();
              reversAnimation = true;
            }
          }
        }
        setState(() {});
      },
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/arrow_left.svg'),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.we()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.we()),
            Text(
              "Verify Phone",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.w),
            Text(
              "Please enter the code we just sent to phone number +(998) ${widget.userModel.phoneNumber.substring(4,6)}-XXX-XX-${widget.userModel.phoneNumber.substring(11,13)}",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(height: 37.w),
            Align(
              alignment: animationAlign.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(
                    4,
                    (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: (index < pinCode.length)
                              ? Colors.white
                              : Colors.grey.shade200,
                          border: Border.all(
                            color: index < pinCode.length
                                ? error
                                    ? Colors.red
                                    : Colors.blue
                                : Colors.grey.shade200,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: (index < pinCode.length)
                            ? Center(
                                child: Text(
                                  list[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                              )
                            : const SizedBox(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 37),
            if (!visibleRestart)
              Center(
                child: Text(
                  "Resend code in $_start seconds",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            if (visibleRestart)
              Center(
                child: TextButton(
                  onPressed: () {
                    _start = 60;
                    visibleRestart = false;
                    startTimer();
                    context.read<AuthBloc>().add(
                      RegisterUserEvent(userModel: widget.userModel),
                    );
                    setState(() {});

                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  ),
                  child: Text(
                    "Resend code",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            SizedBox(height: visibleRestart ? 35.h : 58.h),
            SizedBox(height: 33.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonItems(title: "1"),
                buttonItems(title: "2"),
                buttonItems(title: "3"),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonItems(title: "4"),
                buttonItems(title: "5"),
                buttonItems(title: "6"),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonItems(title: "7"),
                buttonItems(title: "8"),
                buttonItems(title: "9"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 16.h,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    ".",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                buttonItems(title: "0"),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.h,
                      vertical: 16.w,
                    ),
                  ),
                  onPressed: () {
                    if (pinCode.isNotEmpty) {
                      setState(() {
                        pinCode = pinCode.substring(0, pinCode.length - 1);
                        list = pinCode.split('');
                        if (list.length < 4) {
                          error = false;
                        }
                      });
                    }
                  },
                  child: SvgPicture.asset('assets/icons/back_space.svg'),
                ),
              ],
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (BuildContext context, AuthState state) {
                if (state.statusMessage == "query_ok") {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return VerifiedScreen();
                  }));
                }
              },
              child: const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    animationController.dispose();
    super.dispose();
  }
}
