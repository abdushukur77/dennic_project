import 'package:dennic_project/utils/colors/app_colors.dart';
import 'package:dennic_project/utils/size/size_utils.dart';
import 'package:dennic_project/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyTextFromField extends StatelessWidget {
  const MyTextFromField(
      {super.key,
      required this.labelText,
      this.obzorText = false,
      required this.perefixIcon,
      this.suffixIcon,
      this.onTab,
      this.textInputAction = TextInputAction.next,
      required this.valueChanged});

  final String labelText;
  final bool obzorText;
  final String perefixIcon;
  final String? suffixIcon;
  final VoidCallback? onTab;
  final TextInputAction textInputAction;
  final ValueChanged<String> valueChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: perefixIcon.contains("call")
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      maxLength: perefixIcon.contains("call") ? 8 : null,
      onChanged: valueChanged,
      textInputAction: textInputAction,
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
        prefixIcon: perefixIcon.contains("png")
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("+9989"),
                ],
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.we(), vertical: 10.we()),
                child: SvgPicture.asset(
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
  }
}
