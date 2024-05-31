import 'package:dennic_project/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowDialogItems extends StatelessWidget {
  const ShowDialogItems({
    super.key,
    required this.title,
    required this.onTap1,
    required this.onTap2,
  });

  final String title;
  final VoidCallback onTap1;
  final VoidCallback onTap2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      backgroundColor: const Color(0xFF252525),
      icon: SvgPicture.asset(
        AppImages.lock,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: const Color(0xFFCFCFCF),
          fontSize: 23.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 112.w,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5.r,
                    ),
                  ),
                ),
                onPressed: onTap1,
                child: Text(
                  "No",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 112.w,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF30BE71),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5.r,
                    ),
                  ),
                ),
                onPressed: onTap2,
                child: Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
