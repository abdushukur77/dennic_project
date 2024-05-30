import 'dart:async';

import 'package:dennic_project/screens/register_and_login/forgot_password/forgot_verify_code_screen/widget/number_pad_widget.dart';
import 'package:dennic_project/screens/register_and_login/forgot_password/forgot_verify_code_screen/widget/pin_code_display.dart';
import 'package:dennic_project/screens/register_and_login/forgot_password/forgot_verify_code_screen/widget/timer_display_widget.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../blocs/auth/auth_bloc.dart';
import '../../../../blocs/auth/auth_event.dart';
import '../../../../blocs/auth/auth_state.dart';
import '../../verified/verified.dart';
import '../new_pasword.dart';

class ForgotVerifyCodeScreen extends StatefulWidget {
  const ForgotVerifyCodeScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;

  @override
  State<ForgotVerifyCodeScreen> createState() => _ForgotVerifyCodeScreenState();
}

class _ForgotVerifyCodeScreenState extends State<ForgotVerifyCodeScreen>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> animationAlign;
  String pinCode = "";
  int _start = 100;
  late Timer _timer;
  bool visibleRestart = false;
  bool error = false;
  bool isCorrect = false;

  late AnimationController globalAnimationController;

  @override
  void initState() {
    super.initState();
    startTimer();

    globalAnimationController = AnimationController(
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
    ]).animate(CurvedAnimation(
        parent: globalAnimationController, curve: Curves.decelerate));

    globalAnimationController.addListener(() {
      setState(() {});
    });
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

  void onNumberPressed(String title) {
    if (pinCode.length < 4) {
      pinCode += title;
      if (pinCode.length == 4) {
        debugPrint(pinCode);
        context.read<AuthBloc>().add(
              AuthVerifyOtpCoderEvent(
                phoneNumber: widget.phoneNumber,
                password: int.parse(pinCode),
              ),
            );
      }
      setState(() {});
    }
  }

  void onDeletePressed() {
    if (pinCode.isNotEmpty) {
      setState(() {
        pinCode = pinCode.substring(0, pinCode.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state.statusMessage == "token") {
          error = true;
          isCorrect = true;
          await Future.delayed(const Duration(seconds: 1));
          if(!context.mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const NewPassworScreen();
              },
            ),
          );
        }
      },
      child: Scaffold(
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
        body: BlocConsumer<AuthBloc, AuthState>(
          builder: (BuildContext context, AuthState state) {
            return Padding(
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
                    "Please enter the code we just sent to phone number",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(height: 37.w),
                  PinCodeDisplay(
                    pinCode: pinCode,
                    isCorrect: isCorrect,
                    error: error,
                    animationAlign: animationAlign,
                  ),
                  const SizedBox(height: 37),
                  TimerDisplay(
                    visibleRestart: visibleRestart,
                    start: _start,
                    onResend: () {
                      _start = 60;
                      visibleRestart = false;
                      startTimer();
                      pinCode = '';
                      setState(() {});
                    },
                  ),
                  SizedBox(height: visibleRestart ? 35.h : 58.h),
                  SizedBox(height: 33.w),
                  NumberPad(
                    onNumberPressed: onNumberPressed,
                    onDeletePressed: onDeletePressed,
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (BuildContext context, AuthState state) {
                      if (state.statusMessage == "query_ok") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const VerifiedScreen();
                            },
                          ),
                        );
                      }
                    },
                    child: const SizedBox(),
                  ),
                ],
              ),
            );
          },
          listener: (BuildContext context, AuthState state) {
            if (state.formStatus == FormStatus.error) {
              pinCode = '';
              setState(() {});
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    globalAnimationController.dispose();
    super.dispose();
  }
}
