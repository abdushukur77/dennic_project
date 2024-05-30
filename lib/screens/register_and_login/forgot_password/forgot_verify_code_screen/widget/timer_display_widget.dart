import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerDisplay extends StatelessWidget {
  final bool visibleRestart;
  final int start;
  final VoidCallback onResend;

  const TimerDisplay({
    Key? key,
    required this.visibleRestart,
    required this.start,
    required this.onResend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: visibleRestart
          ? TextButton(
              onPressed: onResend,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              ),
              child: Text(
                "Resend code",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.sp,
                ),
              ),
            )
          : Text(
              "Resend code in $start seconds",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
    );
  }
}
