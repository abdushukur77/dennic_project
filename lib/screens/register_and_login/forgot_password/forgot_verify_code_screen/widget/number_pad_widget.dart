import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NumberPad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final VoidCallback onDeletePressed;

  const NumberPad({
    Key? key,
    required this.onNumberPressed,
    required this.onDeletePressed,
  }) : super(key: key);

  Widget buttonItems({required String title}) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 28.w,
          vertical: 8.h,
        ),
        backgroundColor: Colors.white10,
      ),
      onPressed: () => onNumberPressed(title),
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
    return Column(
      children: [
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
              onPressed: onDeletePressed,
              child: SvgPicture.asset('assets/icons/back_space.svg'),
            ),
          ],
        ),
      ],
    );
  }
}
