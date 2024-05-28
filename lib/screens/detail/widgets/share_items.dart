import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareItems extends StatelessWidget {
  const ShareItems({super.key, required this.icon, required this.onTap});

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            icon,
            width: 60.w,
            height: 85.h,
            fit: BoxFit.cover,
          ),
        ),
        24.getH(),
      ],
    );
  }
}
