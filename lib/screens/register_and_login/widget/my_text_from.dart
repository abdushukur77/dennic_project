import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyTextFromField extends StatelessWidget {
  const MyTextFromField({
    super.key,
    required this.labelText,
    this.obzorText = false,
    required this.perefixIcon,
    this.suffixIcon,
    this.onTab,
  });

  final String labelText;
  final bool obzorText;
  final String perefixIcon;
  final String? suffixIcon;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.urbanistBold.copyWith(
        fontSize: 14.sp,
        color: AppColors.c191A26,
      ),
      obscureText: obzorText,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.c257CFF,
            width: 1.we(),
          ),

        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.cE9ECF2,
            width: 1.we(),
          ),
        ),
        label: Text(
          labelText,
          style: AppTextStyle.urbanistRegular.copyWith(
            fontSize: 14.sp,
            color: AppColors.c7E8CA0,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.we(), vertical: 10.we()),
          child: perefixIcon.contains("png")
              ? Image.asset(
                  perefixIcon,
                  width: 30.we(),
                  height: 30.we(),
                )
              : SvgPicture.asset(
                  perefixIcon,
                ),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onTab,
                icon: SvgPicture.asset(suffixIcon!),
              )
            : null,
      ),
    );
    ;
  }
}
